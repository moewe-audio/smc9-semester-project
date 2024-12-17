/*
  ==============================================================================

    SchemeStack.h
    Created: 16 Sep 2024 1:49:59pm
    Author:  Levin

  ==============================================================================
*/

#pragma once

#include "JuceHeader.h"
#include "SchemeConnection.h"
#include "DynamicStiffString.h"
#include "ETC.h"
#include "BiquadLowpass.h"
#include "Utils.h"
#include "ADSREnvelope.h"
#include "ExcitationConnection.h"

class SchemeStack
{
public:
    SchemeStack(AudioProcessorValueTreeState& apvts, std::unique_ptr<ADSREnvelope> const &adsr) : apvts(apvts), adsr(adsr) {};
    void prepareToPlay(double sampleRate);
    void processStack(int sampleNo);
    void processStackBlock(juce::AudioBuffer<float>& buffer);
    double getOutput();
    void createStack(int numSchemes);
    void setSchemesFrequency(float freq) 
    {
        for (auto scheme : schemes)
        {
            scheme->setFrequency(freq);
        }
    }
    
private:
    
    float updateFeedbackGain(int schemeId);
    float getExponentialDecayBurst(double amplitude, double lambda, int sampleNo);
    
    double alphaMax, phi, cutoffMax;
    AudioProcessorValueTreeState& apvts;
    juce::OwnedArray<ETC> etc;
    juce::OwnedArray<BiquadLowPassFilter> lpFilters;
    juce::NamedValueSet schemeParams;
    juce::OwnedArray<DynamicStiffString> schemes;
    juce::OwnedArray<SchemeConnection> connections;
    juce::OwnedArray<SchemeConnection> feedbackConnections;
    std::unique_ptr<ExcitationConnection> exciteConnection;
    std::unique_ptr<ADSREnvelope> const &adsr;
    float * schemeGains;
    float * feedbackGains;
    float * feedbackAlphas;
    float * connectionForces;
    
    double sampleRate;
};
