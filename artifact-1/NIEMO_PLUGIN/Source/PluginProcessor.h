/*
  ==============================================================================

    This file contains the basic framework code for a JUCE plugin processor.

  ==============================================================================
*/

#pragma once

#include <JuceHeader.h>
#include "Wave1DOscillator.h"
#include "SimpleString.h"
#include "DynamicStiffString.h"
#include "SchemeConnection.h"
#include "SchemeStack.h"
#include "ETC.h"
#include "BiquadLowpass.h"
#include "ADSREnvelope.h"

//==============================================================================
/**
*/
class NIEMO_PLUGINAudioProcessor  : public juce::AudioProcessor
{
public:
    //==============================================================================
    NIEMO_PLUGINAudioProcessor();
    ~NIEMO_PLUGINAudioProcessor() override;

    //==============================================================================
    void prepareToPlay (double sampleRate, int samplesPerBlock) override;
    void releaseResources() override;

   #ifndef JucePlugin_PreferredChannelConfigurations
    bool isBusesLayoutSupported (const BusesLayout& layouts) const override;
   #endif

    void processBlock (juce::AudioBuffer<float>&, juce::MidiBuffer&) override;

    //==============================================================================
    juce::AudioProcessorEditor* createEditor() override;
    bool hasEditor() const override;

    //==============================================================================
    const juce::String getName() const override;

    bool acceptsMidi() const override;
    bool producesMidi() const override;
    bool isMidiEffect() const override;
    double getTailLengthSeconds() const override;

    //==============================================================================
    int getNumPrograms() override;
    int getCurrentProgram() override;
    void setCurrentProgram (int index) override;
    const juce::String getProgramName (int index) override;
    void changeProgramName (int index, const juce::String& newName) override;

    //==============================================================================
    void getStateInformation (juce::MemoryBlock& destData) override;
    void setStateInformation (const void* data, int sizeInBytes) override;
    
    int getSchemeCount() { return schemeCount; };

    juce::AudioProcessorValueTreeState apvts;
    std::unique_ptr<SchemeStack> schemeStack;
    double gainAdjustment = 0;
    
private:
    void limitBuffer(juce::AudioBuffer<float>& buffer, float threshold);
    void scaleBuffer(juce::AudioBuffer<float>& buffer, float scalingFactor);
    void updateGain();
    
    juce::AudioProcessorValueTreeState::ParameterLayout createParameterLayout();
    
    //==============================================================================
    JUCE_DECLARE_NON_COPYABLE_WITH_LEAK_DETECTOR (NIEMO_PLUGINAudioProcessor)
    
    double controlRate;
    static const int schemeCount = 2;
    std::unique_ptr<BiquadLowPassFilter> lpFilter;
    std::unique_ptr<ADSREnvelope> adsr;
};
