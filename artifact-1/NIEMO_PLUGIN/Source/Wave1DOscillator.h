/*
  ==============================================================================

    Wave1DOscillator.h
    Created: 23 Aug 2024 5:00:07pm
    Author:  Levin

  ==============================================================================
*/

#pragma once


#include <JuceHeader.h>

class Wave1DOsc
{
public:
    Wave1DOsc (juce::AudioProcessorValueTreeState& state);
    void applyOscillator (juce::AudioBuffer<float>& buffer);
    void prepareToPlay (double sampleRate, int samplesPerBlock);
    
private:
    void updateWaveEquation();
    void exciteString();
    
    double sampleRate = 44100;
    int samplesPerBlock = 128;
    int numPoints = 1024;
    const float c = 343.f;
    double lambda;
    float L = 1.f;
    double timeStep;
    double spatialStep;
    double dampingTerm = 0.0001;
    
    std::vector<float> u, uPrev, uNext;
    
    juce::AudioProcessorValueTreeState& apvts;

};
