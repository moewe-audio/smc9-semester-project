/*
  ==============================================================================

    Wave1DOscillator.cpp
    Created: 23 Aug 2024 5:00:07pm
    Author:  Levin

  ==============================================================================
*/

#include "Wave1DOscillator.h"

Wave1DOsc::Wave1DOsc (juce::AudioProcessorValueTreeState& state)
    : apvts(state)
{
}

void Wave1DOsc::prepareToPlay (double sampleRate, int samplesPerBlock)
{
    this->sampleRate = sampleRate;
    this->samplesPerBlock = samplesPerBlock;
    
    timeStep = (double) 1.0 / sampleRate;
    L = 2.6f;
    spatialStep = c * timeStep;
    numPoints = floor(L / spatialStep);
    spatialStep = (double) L / numPoints;
    lambda = (c * timeStep) / spatialStep;
    jassert(lambda <= 1.0);
    u.resize(numPoints, 0.0f);
    uPrev.resize(numPoints, 0.0f);
    uNext.resize(numPoints, 0.0f);

    for (int i = 0; i < numPoints; ++i)
    {
        float x = static_cast<float>(i) / (numPoints - 1);
        u[i] = std::exp(-100.0f * (x - 0.5f) * (x - 0.5f)); // Gaussian centered at x=0.5
    }
    
    uPrev = u;
}

void Wave1DOsc::applyOscillator (juce::AudioBuffer<float>& buffer)
{
    auto* channelData = buffer.getWritePointer(0);

    for (int sample = 0; sample < buffer.getNumSamples(); ++sample)
    {
        updateWaveEquation();

        channelData[sample] = u[numPoints / 2];
    }

}

void Wave1DOsc::updateWaveEquation()
{

    float damping = apvts.getRawParameterValue("damping")->load();
    float f_damping = apvts.getRawParameterValue("f_damping")->load();

    
    for (int i = 1; i < numPoints - 1; ++i)
    {
        uNext[i] = 2.0f * u[i] - uPrev[i] + lambda * lambda * (u[i + 1] - 2.0f * u[i] + u[i - 1]) - damping * (u[i] - uPrev[i]);
        uNext[i] -= f_damping * ((u[i+1] - uPrev[i+1] )- (2.f*(u[i] - uPrev[i])) + (u[i-1] - uPrev[i-1]));
    }

    uPrev = u;
    u = uNext;
}

void Wave1DOsc::exciteString()
{
//    for (int i = 0; i < numPoints; ++i)
//    {
//        u[i] = sin(M_PI * i / (numPoints - 1));
//    }
}
