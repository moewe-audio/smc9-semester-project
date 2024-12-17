#include <Bela.h>
#include <libraries/Scope/Scope.h>
#include "libraries/Biquad/Biquad.h"
#include "dsp/DynamicStiffString.h"
#include "dsp/Yin.h"
#include <string>
#include <iostream>

#include "dsp/PitchShift.h"
#include "dsp/PitchMap.h"
#include "dsp/Window.h"
#include "dsp/StringConnection.h"
#include "dsp/InputConnection.h"

enum {
	OPEN = 0,
	JUST_CLOSED,
	CLOSED,
	JUST_OPEN
};

int btn1DebounceState = CLOSED;
int btn1DebounceCounter = 0;
int btn2DebounceState = CLOSED;
int btn2DebounceCounter = 0;
int debounceInterval = 0;

DynamicStiffString string1;
DynamicStiffString string2;
StringConnection stringConnection(string1, string2, true, 1.0);
Yin yin;
float trackedPitch = 0;
float correctedPitch = 0;
float lastPitch = 440.f;
float pitchSmoothing = 0.57891f;
float pitchCorrectionRatio = 1.0;
float pitchScaleFactor = 1.f;
float MIN_PITCH_SCALE = 0.25f;
float MAX_PITCH_SCALE = 4.f;
PitchMapper pitchMapper;
float prob;
Scope scope;
AuxiliaryTask myTask;
int logCounter = 0;
AuxiliaryTask logTask;
Biquad fLpFilter;
Biquad fHpFilter;
Biquad hpFilter;

int gAudioFramesPerAnalogFrame;
int gAudioFramesPerDigitalFrame;

float POT_MAX = 0.83;
float POW_MIN = 0.0;
float FEEDBACK_MAX = 0.276; 

int btn1Pin = 6;
int btn2Pin = 10;
float stringBalance = 0.5;
float stringInputMixBalance = 0;

void getPitchTask(void* arg) {
    std::vector<float> windowBuffer = Window::getWindowBuffer();
	float res = yin.getPitch(windowBuffer.data());
	prob = yin.getProbability();
	if (prob >= 0.997)
	{
		trackedPitch = res;
		pitchMapper.setF0EmptyString(res);
		correctedPitch = pitchMapper.mapPitch(res);
		correctedPitch = (1.0 - pitchSmoothing) * correctedPitch + pitchSmoothing * lastPitch;
		if (correctedPitch < 100.f || correctedPitch > 1000.f)
		{
			correctedPitch = lastPitch;
		}
		lastPitch = correctedPitch;
		if (res > 0.0f)
		{
			pitchCorrectionRatio = correctedPitch / res;
			pitchCorrectionRatio *= pitchScaleFactor;
		}
	}
}

void updateButtonState(
    int btnState, 
    int *btnDebounceState, 
    int *btnDebounceCounter, 
    float pitchScaling, 
    int debounceInterval
) {
    if (*btnDebounceState == OPEN) {
        if (btnState == 0) {
            *btnDebounceState = JUST_CLOSED;
            *btnDebounceCounter = 0;
            pitchScaling *= pitchScaleFactor;
            if (pitchScaling >= MIN_PITCH_SCALE && pitchScaling <= MAX_PITCH_SCALE)
            {
	            pitchScaleFactor = pitchScaling;
            }
        }
    } else if (*btnDebounceState == JUST_CLOSED) {
        if (++(*btnDebounceCounter) >= debounceInterval) {
            *btnDebounceState = CLOSED;
        }
    } else if (*btnDebounceState == CLOSED) {
        if (btnState != 0) {
            *btnDebounceState = JUST_OPEN;
            *btnDebounceCounter = 0;
        }
    } else if (*btnDebounceState == JUST_OPEN) {
        if (++(*btnDebounceCounter) >= debounceInterval) {
            *btnDebounceState = OPEN;
        }
    }
}

void dbg_log(void* arg) {
	std::cout << std::to_string(stringConnection.force1);
	std::cout << " | ";
	std::cout << std::to_string(stringConnection.force2);
	std::cout << "\n";
}

bool setup(BelaContext *context, void *userData)
{
	// String 1
    double r = 0.00012;
    double L = 0.8;
    double rho = 7850;
    double T = 100;
    double E = 2e12;
    double sigma0 = 0.1;
    double sigma1 = 0.005;
    string1.prepareToPlay(context->audioSampleRate, L, rho, r, T, E, sigma0, sigma1);
    
    // String 2
    // r = 0.00012;
    // L = 1.4;
    // rho = 7850;
    // T = 80;
    // E = 1e9;
    // sigma0 = 0.1;
    // sigma1 = 0.005;
    string2.prepareToPlay(context->audioSampleRate, L, rho, r, T, E, sigma0, sigma1);
    
    stringConnection.prepareToPlay(context->audioSampleRate); 
    stringConnection.setForce1(1.0);
    stringConnection.setForce2(1.0);

    yin.initialize(context->audioSampleRate, 512);
	myTask = Bela_createAuxiliaryTask(getPitchTask, 95, "getPitchTask");
	logTask = Bela_createAuxiliaryTask(dbg_log, 30, "logTask");
	fLpFilter.setup({context->audioSampleRate, BiquadCoeff::lowpass, 1000.f, 5, -1.0});
	fHpFilter.setup({context->audioSampleRate, BiquadCoeff::highpass, 300.f, 5, -1.0});
	hpFilter.setup({context->audioSampleRate, BiquadCoeff::highpass, 8000, 1.f, 0.0});
	PitchShift::init(1024, 256, 1.0f, 0.5, context->audioSampleRate);	
	gAudioFramesPerAnalogFrame = context->audioFrames / context->analogFrames;
	gAudioFramesPerDigitalFrame = context->audioFrames / context->digitalFrames;
	scope.setup(2, context->audioSampleRate / gAudioFramesPerAnalogFrame);
	pinMode(context, 0, btn1Pin, INPUT);
	pinMode(context, 0, btn2Pin, INPUT);
	debounceInterval = 0.06 * context->digitalSampleRate;
    return true;
}
void render(BelaContext *context, void *userData)
{
	for(unsigned int n = 0; n < context->audioFrames; n++) {
		if(gAudioFramesPerAnalogFrame && !(n % gAudioFramesPerAnalogFrame)) {
			stringBalance = map(analogRead(context, n/gAudioFramesPerAnalogFrame, 2),0,POT_MAX,0.0, 1.0);
			stringInputMixBalance = map(analogRead(context, n/gAudioFramesPerAnalogFrame, 6),0,POT_MAX,0.0, 1.0);
			string2.setRHO(map(analogRead(context, n/gAudioFramesPerAnalogFrame, 0),0,POT_MAX,15700.f,4000.f));
			string1.setRHO(map(analogRead(context, n/gAudioFramesPerAnalogFrame, 1),0,POT_MAX,15700.f,4000.f));
			string2.setSigma1(map(analogRead(context, n/gAudioFramesPerAnalogFrame, 3),0,POT_MAX,0.1,0.001));
			string1.setSigma1(map(analogRead(context, n/gAudioFramesPerAnalogFrame, 7),0,POT_MAX,0.1,0.001));
			float f2 = map(analogRead(context, n/gAudioFramesPerAnalogFrame, 5),0.1,POT_MAX,0.8,0.0);
			float f1 = map(analogRead(context, n/gAudioFramesPerAnalogFrame, 4),0.1,POT_MAX,0.8, 0.0);
			if (f2 < 0.009)
			{
				f2 = 0.f;
			}
			if (f1 < 0.009)
			{
				f1 = 0.f;	
			}
			if (stringBalance < 0.009)
			{
				stringBalance = 0.f;
			}
			if (stringBalance > 0.991)
			{
				stringBalance = 1;
			}
			stringConnection.setForce2(f2);	
			stringConnection.setForce1(f1);
			// scope.log(stringConnection.force1, stringConnection.force2);
		// scope.log(
		// 	analogRead(context, n/gAudioFramesPerAnalogFrame, 0),
		// 	analogRead(context, n/gAudioFramesPerAnalogFrame, 1),
		// 	analogRead(context, n/gAudioFramesPerAnalogFrame, 2),
		// 	analogRead(context, n/gAudioFramesPerAnalogFrame, 3),
		// 	analogRead(context, n/gAudioFramesPerAnalogFrame, 4),
		// 	analogRead(context, n/gAudioFramesPerAnalogFrame, 5),
		// 	analogRead(context, n/gAudioFramesPerAnalogFrame, 6),
		// 	analogRead(context, n/gAudioFramesPerAnalogFrame, 7)
		// );
		}
		
		if(gAudioFramesPerDigitalFrame && !(n % gAudioFramesPerDigitalFrame)) {
	        int btn1State = digitalRead(context, n / gAudioFramesPerDigitalFrame, btn1Pin);
	        int btn2State = digitalRead(context, n / gAudioFramesPerDigitalFrame, btn2Pin);
	        updateButtonState(btn1State, &btn1DebounceState, &btn1DebounceCounter, 0.5f, debounceInterval);
	        updateButtonState(btn2State, &btn2DebounceState, &btn2DebounceCounter, 2.f, debounceInterval);
		}
		float out = audioRead(context, n, 0);
		float filteredOut = fLpFilter.process(out);
		filteredOut = fHpFilter.process(filteredOut);
		if (Window::addSample(filteredOut))
		{
			Bela_scheduleAuxiliaryTask(myTask);
		}
		out = PitchShift::processSample(out, pitchCorrectionRatio);
		out = hpFilter.process(out);
		logCounter++;
		if (logCounter == 44100)
		{
			logCounter = 0;
			Bela_scheduleAuxiliaryTask(logTask);
		}

		string1.setFrequency(correctedPitch * pitchScaleFactor);
		string1.refreshCoefficients(false);
		string2.refreshCoefficients(false);
	    string1.calculateScheme();
		string2.calculateScheme();
		stringConnection.updateConnectionPoint();
		string1.applyForceAt(0.37f * string1.getN(), 1 , stringInputMixBalance *  out * 0.03);
		string2.applyForceAt( 0.37f * string1.getN(), 1 , (1.0 - stringInputMixBalance)  * out * 0.03);
		string1.forwardTimeStep();
		string2.forwardTimeStep();
		float finalOut = string1.getOutput(0.3) * stringBalance;
		finalOut += string2.getOutput(0.3) * (1.0 - stringBalance);
		finalOut *= 20;
		audioWrite(context, n, 0, finalOut);
		audioWrite(context, n, 1, finalOut);
		// audioWrite(context, n, 0, out);
		// audioWrite(context, n, 1, out);
	}
}

void cleanup(BelaContext *context, void *userData)
{

}
