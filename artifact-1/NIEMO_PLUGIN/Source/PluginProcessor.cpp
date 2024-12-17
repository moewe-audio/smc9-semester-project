/*
  ==============================================================================

    This file contains the basic framework code for a JUCE plugin processor.

  ==============================================================================
*/

#include "PluginProcessor.h"
#include "PluginEditor.h"
#include "Utils.h"

//==============================================================================
NIEMO_PLUGINAudioProcessor::NIEMO_PLUGINAudioProcessor()
#ifndef JucePlugin_PreferredChannelConfigurations
     : AudioProcessor (BusesProperties()
                     #if ! JucePlugin_IsMidiEffect
                      #if ! JucePlugin_IsSynth
                       .withInput  ("Input",  juce::AudioChannelSet::stereo(), true)
                      #endif
                       .withOutput ("Output", juce::AudioChannelSet::stereo(), true)
                     #endif
                       )
#endif
,apvts(*this, nullptr, "Parameters", createParameterLayout())
{ }

NIEMO_PLUGINAudioProcessor::~NIEMO_PLUGINAudioProcessor()
{ }

//==============================================================================
const juce::String NIEMO_PLUGINAudioProcessor::getName() const
{
    return JucePlugin_Name;
}

bool NIEMO_PLUGINAudioProcessor::acceptsMidi() const
{
   #if JucePlugin_WantsMidiInput
    return true;
   #else
    return false;
   #endif
}

bool NIEMO_PLUGINAudioProcessor::producesMidi() const
{
   #if JucePlugin_ProducesMidiOutput
    return true;
   #else
    return false;
   #endif
}

bool NIEMO_PLUGINAudioProcessor::isMidiEffect() const
{
   #if JucePlugin_IsMidiEffect
    return true;
   #else
    return false;
   #endif
}

double NIEMO_PLUGINAudioProcessor::getTailLengthSeconds() const
{
    return 0.0;
}

int NIEMO_PLUGINAudioProcessor::getNumPrograms()
{
    return 1;   // NB: some hosts don't cope very well if you tell them there are 0 programs,
                // so this should be at least 1, even if you're not really implementing programs.
}

int NIEMO_PLUGINAudioProcessor::getCurrentProgram()
{
    return 0;
}

void NIEMO_PLUGINAudioProcessor::setCurrentProgram (int index)
{
}

const juce::String NIEMO_PLUGINAudioProcessor::getProgramName (int index)
{
    return {};
}

void NIEMO_PLUGINAudioProcessor::changeProgramName (int index, const juce::String& newName)
{
}

//==============================================================================
void NIEMO_PLUGINAudioProcessor::prepareToPlay (double sampleRate, int samplesPerBlock)
{
    controlRate = sampleRate / samplesPerBlock;
    adsr = std::make_unique<ADSREnvelope>(apvts);
    adsr->prepareToPlay(sampleRate, samplesPerBlock);
    schemeStack = std::make_unique<SchemeStack>(apvts, adsr);
    schemeStack->prepareToPlay(sampleRate);
    schemeStack->createStack(schemeCount);
    lpFilter = std::make_unique<BiquadLowPassFilter>();
    lpFilter->setFilterParameters(20, controlRate);
}

void NIEMO_PLUGINAudioProcessor::releaseResources()
{
    // When playback stops, you can use this as an opportunity to free up any
    // spare memory, etc.
}

#ifndef JucePlugin_PreferredChannelConfigurations
bool NIEMO_PLUGINAudioProcessor::isBusesLayoutSupported (const BusesLayout& layouts) const
{
  #if JucePlugin_IsMidiEffect
    juce::ignoreUnused (layouts);
    return true;
  #else
    // This is the place where you check if the layout is supported.
    // In this template code we only support mono or stereo.
    // Some plugin hosts, such as certain GarageBand versions, will only
    // load plugins that support stereo bus layouts.
    if (layouts.getMainOutputChannelSet() != juce::AudioChannelSet::mono()
     && layouts.getMainOutputChannelSet() != juce::AudioChannelSet::stereo())
        return false;

    // This checks if the input layout matches the output layout
   #if ! JucePlugin_IsSynth
    if (layouts.getMainOutputChannelSet() != layouts.getMainInputChannelSet())
        return false;
   #endif

    return true;
  #endif
}
#endif

void NIEMO_PLUGINAudioProcessor::processBlock (juce::AudioBuffer<float>& buffer, juce::MidiBuffer& midiMessages)
{
    juce::ScopedNoDenormals noDenormals;
    auto totalNumInputChannels  = getTotalNumInputChannels();

    for (auto i = 0; i < totalNumInputChannels; ++i)
        buffer.clear (i, 0, buffer.getNumSamples());
    
    int noteNumber = -1;
    for (const juce::MidiMessageMetadata meta : midiMessages)
    {
        auto msg = meta.getMessage();
        if (msg.isNoteOn())
        {
//            schemeStack->exciteScheme(0);
            noteNumber = msg.getNoteNumber();
            break;
        }
    }
    
    adsr->processBlock(midiMessages);
    
    if (noteNumber >= 0)
    {
        float frequency = juce::MidiMessage::getMidiNoteInHertz(noteNumber);
        schemeStack->setSchemesFrequency(frequency);
    }

    schemeStack->processStackBlock(buffer);
    scaleBuffer(buffer, 1);
//    limitBuffer(buffer, 0.9);
    
}

//==============================================================================
bool NIEMO_PLUGINAudioProcessor::hasEditor() const
{
    return true; // (change this to false if you choose to not supply an editor)
}

juce::AudioProcessorEditor* NIEMO_PLUGINAudioProcessor::createEditor()
{
    return new NIEMO_PLUGINAudioProcessorEditor (*this);
}

//==============================================================================
void NIEMO_PLUGINAudioProcessor::getStateInformation (juce::MemoryBlock& destData)
{
    // You should use this method to store your parameters in the memory block.
    // You could do that either as raw data, or use the XML or ValueTree classes
    // as intermediaries to make it easy to save and load complex data.
}

void NIEMO_PLUGINAudioProcessor::setStateInformation (const void* data, int sizeInBytes)
{
    // You should use this method to restore your parameters from this memory block,
    // whose contents will have been created by the getStateInformation() call.
}

//==============================================================================
// This creates new instances of the plugin..
juce::AudioProcessor* JUCE_CALLTYPE createPluginFilter()
{
    return new NIEMO_PLUGINAudioProcessor();
}

juce::AudioProcessorValueTreeState::ParameterLayout NIEMO_PLUGINAudioProcessor::createParameterLayout()
{
    std::vector<std::unique_ptr<juce::RangedAudioParameter>> params;

    for (int i = 0; i < schemeCount; ++i)
    {
        params.push_back(std::make_unique<juce::AudioParameterFloat>(
            juce::ParameterID { ParameterIDs::getSchemeParameter(ParameterIDs::E, i), 1 },
            "E",
            juce::NormalisableRange<float> { 1e9f, 4e11f, 100.f },
            2e11f
        ));

        auto sigma1Range = juce::NormalisableRange<float> { 0.0002f, 0.03f, 0.00001f };
        sigma1Range.setSkewForCentre(0.003);
        params.push_back(std::make_unique<juce::AudioParameterFloat>(
            juce::ParameterID { ParameterIDs::getSchemeParameter(ParameterIDs::SIGMA1, i), 1 },
            "sigma1",
            sigma1Range,
            0.003f
        ));

        params.push_back(std::make_unique<juce::AudioParameterFloat>(
            juce::ParameterID { ParameterIDs::getSchemeParameter(ParameterIDs::RHO, i), 1 },
            "rho",
            juce::NormalisableRange<float> { 3925.f, 15700.f, 100.f },
            7850.f
        ));
        
        params.push_back(std::make_unique<juce::AudioParameterFloat>(
            juce::ParameterID { ParameterIDs::getSchemeParameter(ParameterIDs::OUT_GAIN, i), 1 },
            "out_gain",
            juce::NormalisableRange<float> { 0.f, 1.f, 0.01f },
            0.5f
        ));
        
        auto dampingRange = juce::NormalisableRange<float> { 0.00, 0.99999, 0.00001 };
        dampingRange.setSkewForCentre(0.8);
        params.push_back(std::make_unique<juce::AudioParameterFloat>(
            juce::ParameterID { ParameterIDs::getSchemeParameter(ParameterIDs::FEEDBACK_CHAOS, i), 1 },
            "feedback_chaos",
            dampingRange,
            0.f
        ));
        
        params.push_back(std::make_unique<juce::AudioParameterFloat>(
            juce::ParameterID { ParameterIDs::getSchemeParameter(ParameterIDs::FEEDBACK_GAIN, i), 1 },
            "scheme_feedback",
            juce::NormalisableRange<float> { 0.f, 1.f, 0.01f},
            0.f
        ));
        
        params.push_back(std::make_unique<juce::AudioParameterFloat>(
            juce::ParameterID { ParameterIDs::getSchemeParameter(ParameterIDs::SEND_CHANNEL, i), 1 },
            "send_channel",
            juce::NormalisableRange<float> { 0.f, 1.f, 0.01f},
            0.f
        ));
    }
    
    params.push_back(std::make_unique<juce::AudioParameterFloat>(
        juce::ParameterID { ParameterIDs::SCHEME_FREQ, 1 },
        "scheme_freq",
        juce::NormalisableRange<float> { 40.f, 1200, 1.f },
        100.f
    ));
    

    
    params.push_back(std::make_unique<juce::AudioParameterFloat>(
        juce::ParameterID { ParameterIDs::ADSR_ATTACK, 1 },
        "adsr_attack",
        juce::NormalisableRange<float> { 0.01, 2.0, 0.001 },
        0.2
    ));
    
    params.push_back(std::make_unique<juce::AudioParameterFloat>(
        juce::ParameterID { ParameterIDs::ADSR_DECAY, 1 },
        "adsr_decay",
        juce::NormalisableRange<float> { 0.05, 5, 0.001 },
        0.2
    ));
    
    params.push_back(std::make_unique<juce::AudioParameterFloat>(
        juce::ParameterID { ParameterIDs::ADSR_RELEASE, 1 },
        "adsr_release",
        juce::NormalisableRange<float> { 0.01, 10, 0.001 },
        0.2
    ));
    
    params.push_back(std::make_unique<juce::AudioParameterFloat>(
        juce::ParameterID { ParameterIDs::ADSR_SUSTAIN, 1 },
        "adsr_sustain",
        juce::NormalisableRange<float> { 0.01, 1, 0.001 },
        1.f
    ));
    
    return { params.begin(), params.end() };
}

void NIEMO_PLUGINAudioProcessor::limitBuffer(juce::AudioBuffer<float>& buffer, float threshold)
{
    threshold = std::abs(threshold);
    int numChannels = buffer.getNumChannels();
    int numSamples = buffer.getNumSamples();
    for (int channel = 0; channel < numChannels; ++channel)
    {
        float* channelData = buffer.getWritePointer(channel);
        for (int sample = 0; sample < numSamples; ++sample)
        {
            channelData[sample] = std::clamp(channelData[sample], -threshold, threshold);
        }
    }
}

void NIEMO_PLUGINAudioProcessor::scaleBuffer(juce::AudioBuffer<float>& buffer, float scalingFactor)
{
    int numChannels = buffer.getNumChannels();
    int numSamples = buffer.getNumSamples();
    for (int channel = 0; channel < numChannels; ++channel)
    {
        float* channelData = buffer.getWritePointer(channel);

        for (int sample = 0; sample < numSamples; ++sample)
        {
            channelData[sample] *= scalingFactor;
        }
    }
}
