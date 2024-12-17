// adapted from https://learn.bela.io/tutorials/c-plus-plus-for-real-time-audio-programming/phase-vocoder-part-3/

#include <vector>
#include <cmath>
#include <algorithm>
#include <libraries/Fft/Fft.h>
#include <iostream>
#include <Bela.h>
#include "dsp/PitchMap.h"

namespace PitchShift {

Fft gFft;
std::vector<float> gInputBuffer;
std::vector<float> gSynthesisWindowBuffer;
int gFftSize = 1024;
int gHopSize = 256;
float gPitchShift = 0.5;
float gScaleFactor = 0.5;
int gInputBufferPointer = 0;
int gOutputBufferReadPointer = 0;
float gPitchShiftDelta = 0.1f;
int gHopCounter = 0;
const int gBufferSize = 4096; // TODO 1024 ? 16384
int gOutputBufferWritePointer = gFftSize + 2*gHopSize;
float sampleRate = 44100;
float trackedPitch = 0.f;
float correctedPitch = 0;
float lastPitch = 440.f;
float pitchSmoothing = 0.8f;
float pitchCorrectionRatio = 1.0;
float pitchScaleFactor = 0.5;
PitchMapper pitchMapper;

AuxiliaryTask gFftTask;
int gCachedInputBufferPointer = 0;
std::vector<float> gOutputBuffer;
std::vector<float> gAnalysisWindowBuffer;


float wrapPhase(float phaseIn) {
    return (phaseIn >= 0) ? fmodf(phaseIn + M_PI, 2.0 * M_PI) - M_PI : fmodf(phaseIn - M_PI, -2.0 * M_PI) + M_PI;
}

void processFft(unsigned int inPointer, std::vector<float>& outBuffer, unsigned int outPointer) {
 	static std::vector<float> unwrappedBuffer(gFftSize);	// Container to hold the unwrapped time-domain values
	static std::vector<float> lastInputPhases(gFftSize);	// Hold the phases from the previous hop of input signal
	static std::vector<float> lastOutputPhases(gFftSize);	// and output (synthesised) signal
	// These containers hold the converted representation from magnitude-phase
	// into magnitude-frequency, used for pitch shifting
	static std::vector<float> analysisMagnitudes(gFftSize / 2 + 1);
	static std::vector<float> analysisFrequencies(gFftSize / 2 + 1);
	static std::vector<float> synthesisMagnitudes(gFftSize / 2 + 1);
	static std::vector<float> synthesisFrequencies(gFftSize / 2 + 1);
	float cachedPitchShift = gPitchShift;
	// Copy buffer into FFT input
	for(int n = 0; n < gFftSize; n++) {
		int circularBufferIndex = (inPointer + n - gFftSize + gBufferSize) % gBufferSize;
		unwrappedBuffer[n] = gInputBuffer[circularBufferIndex] * gAnalysisWindowBuffer[n];
	}
	
	// Process the FFT based on the time domain input
	gFft.fft(unwrappedBuffer);

	
	// Analyse the lower half of the spectrum. The upper half is just
	// the complex conjugate and does not contain any unique information
	for(int n = 0; n <= gFftSize/2; n++) {
		// Turn real and imaginary components into amplitude and phase
		float amplitude = gFft.fda(n);
		float phase = atan2f(gFft.fdi(n), gFft.fdr(n));

		// Calculate the phase difference in this bin between the last
		// hop and this one, which will indirectly give us the exact frequency
		float phaseDiff = phase - lastInputPhases[n];
		
		// Subtract the amount of phase increment we'd expect to see based
		// on the centre frequency of this bin (2*pi*n/gFftSize) for this
		// hop size, then wrap to the range -pi to pi
		float binCentreFrequency = 2.0 * M_PI * (float)n / (float)gFftSize;
		phaseDiff = wrapPhase(phaseDiff - binCentreFrequency * gHopSize);
		
		// Find deviation in (fractional) number of bins from the centre frequency
		float binDeviation = phaseDiff * (float)gFftSize / (float)gHopSize / (2.0 * M_PI);
		
		// Add the original bin number to get the fractional bin where this partial belongs
		analysisFrequencies[n] = (float)n + binDeviation;
		
		// Save the magnitude for later and for the GUI
		analysisMagnitudes[n] = amplitude;
		
		// Save the phase for next hop
		lastInputPhases[n] = phase;
	}	

	// Zero out the synthesis bins, ready for new data
	for(int n = 0; n <= gFftSize/2; n++) {
		synthesisMagnitudes[n] = synthesisFrequencies[n] = 0;
	}
	
	// Handle the pitch shift, storing frequencies into new bins
	for(int n = 0; n <= gFftSize/2; n++) {
		// TODO: find the nearest bin to the shifted frequency
		int newBin = floorf(n * cachedPitchShift + 0.5);
		
		// Ignore any bins that have shifted above Nyquist
		if(newBin <= gFftSize / 2) {
			synthesisMagnitudes[newBin] += analysisMagnitudes[n];
			synthesisFrequencies[newBin] = analysisFrequencies[n] * cachedPitchShift;
		}
	}
		
	// Synthesise frequencies into new magnitude and phase values for FFT bins
	for(int n = 0; n <= gFftSize / 2; n++) {
	
		float amplitude = synthesisMagnitudes[n];
		float binDeviation = synthesisFrequencies[n] - n;
		float phaseDiff = binDeviation * 2.0 * M_PI * (float)gHopSize / (float)gFftSize;
		float binCentreFrequency = 2.0 * M_PI * (float)n / (float) gFftSize;
		phaseDiff += binCentreFrequency * gHopSize;
		float outPhase = wrapPhase(lastOutputPhases[n] + phaseDiff);
	
	    gFft.fdr(n) = amplitude * cosf(outPhase);
	    gFft.fdi(n) = amplitude * sinf(outPhase);
		
		if(n > 0 && n < gFftSize / 2) {
	        gFft.fdr(gFftSize - n) = gFft.fdr(n);
	        gFft.fdi(gFftSize - n) = -gFft.fdi(n);
		}
		
		lastOutputPhases[n] = outPhase;
	}
		
	// Run the inverse FFT
	gFft.ifft();
	
	for(int n = 0; n < gFftSize; n++) {
		int circularBufferIndex = (outPointer + n - gFftSize + gBufferSize) % gBufferSize;
		outBuffer[circularBufferIndex] += gFft.td(n) * gSynthesisWindowBuffer[n];
	}
}

void process_fft_background(void *)
{
	processFft(gCachedInputBufferPointer, gOutputBuffer, gOutputBufferWritePointer);
	gOutputBufferWritePointer = (gOutputBufferWritePointer + gHopSize) % gBufferSize;
}

void init(int fftSize, int hopSize, float pitchShiftRatio, float scaleFactor, float sampleRate)
{
    	gFftSize = fftSize;
    	gOutputBufferWritePointer = gFftSize + 2*gHopSize;
    	gInputBuffer = std::vector<float>(fftSize * 4);
        gFft.setup(gFftSize);
        gHopSize = hopSize;
        gPitchShift = pitchShiftRatio;
        gScaleFactor = scaleFactor;
        gOutputBuffer.resize(gBufferSize);
        gInputBuffer.resize(gBufferSize);
        gAnalysisWindowBuffer.resize(gFftSize);
        gSynthesisWindowBuffer.resize(gFftSize);
        PitchShift::sampleRate = sampleRate;
        for(int n = 0; n < gFftSize; n++) 
        {
            gAnalysisWindowBuffer[n] = 0.5f * (1.0f - cosf(2.0 * M_PI * n / (float)(gFftSize - 1)));
            gSynthesisWindowBuffer[n] = gAnalysisWindowBuffer[n];
        }
        gFftTask = Bela_createAuxiliaryTask(process_fft_background, 80, "bela-process-fft");
    }
	
	float processSample(float in, float shiftFactor)
	{
		gInputBuffer[gInputBufferPointer++] = in;
		if(gInputBufferPointer >= gBufferSize) {
			gInputBufferPointer = 0;
		}
		float out = gOutputBuffer[gOutputBufferReadPointer];
		gOutputBuffer[gOutputBufferReadPointer] = 0;
		out *= gScaleFactor;
		gOutputBufferReadPointer++;
		if(gOutputBufferReadPointer >= gBufferSize)
			gOutputBufferReadPointer = 0;
		if(++gHopCounter >= gHopSize) {
			gPitchShift += (shiftFactor - gPitchShift) * gPitchShiftDelta;
			gHopCounter = 0;
			gCachedInputBufferPointer = gInputBufferPointer;
			Bela_scheduleAuxiliaryTask(gFftTask);
		}
		return out;
	}

}



