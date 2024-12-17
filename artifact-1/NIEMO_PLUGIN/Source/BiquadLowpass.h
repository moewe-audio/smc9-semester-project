/*
  ==============================================================================

    BiquadLowpass.h
    Created: 22 Sep 2024 1:37:18pm
    Author:  Levin

  ==============================================================================
*/

#pragma once

class BiquadLowPassFilter
{
public:
    BiquadLowPassFilter() : lambda(1000.0), resonance(0.1), sampleRate(44100.0)
    {
        reset();
    }

    void setFilterParameters(double cutoffFrequency, double newSampleRate)
    {
        lambda = cutoffFrequency;
        sampleRate = newSampleRate;
        calculateCoefficients();
    }
    
    void updateParameters(double cutoffFrequency)
    {
        lambda = cutoffFrequency;
        calculateCoefficients();
    }

    void reset()
    {
        z1 = 0.0;
        z2 = 0.0;
    }

    float processSample(float inputSample)
    {
        float outputSample = b0 * inputSample + b1 * z1 + b2 * z2 - a1 * z1 - a2 * z2;
        z2 = z1;
        z1 = inputSample;

        return outputSample;
    }

private:
    double lambda;       // Cutoff frequency
    double resonance;    // Resonance (Q factor), fixed at 0.1
    double sampleRate;

    double b0, b1, b2, a1, a2;
    double z1, z2;

    void calculateCoefficients()
    {
        const double omega = 2.0 * juce::MathConstants<double>::pi * lambda / sampleRate;
        const double alpha = std::sin(omega) / (2.0 * resonance);

        const double cosOmega = std::cos(omega);
        const double norm = 1.0 / (1.0 + alpha);

        b0 = (1.0 - cosOmega) * 0.5 * norm;
        b1 = (1.0 - cosOmega) * norm;
        b2 = (1.0 - cosOmega) * 0.5 * norm;
        a1 = -2.0 * cosOmega * norm;
        a2 = (1.0 - alpha) * norm;
    }
};
