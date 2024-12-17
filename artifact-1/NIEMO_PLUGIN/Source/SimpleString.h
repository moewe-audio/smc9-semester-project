/*
  ==============================================================================

    SimpleString.h
    Created: 7 Sep 2024 8:57:05pm
    Author:  Levin

  ==============================================================================
*/

#pragma once

#include <vector>
#include <JuceHeader.h>
#include "Scheme.h"

class SimpleString : public Scheme
{
public:
    SimpleString () {};

    void prepareToPlay(double sampleRate, int samplesPerBlock, juce::NamedValueSet& parameters);
    void applyOscillator(juce::AudioBuffer<float>& buffer);
    
    double getOutput (double Lratio)
    {
        return u[1][static_cast<int> (round(N * Lratio))];
    }
    
    void excite();
    
    bool shouldExcite() { return excitationFlag; };
    void calculateScheme() override;
    void forwardTimeStep() override;
    double getK() override { return k; };
    double getRho() override { return rho; };
    double getA() override { return A; };
    double getH() override { return h; };
    double getN() override { return N; };
    double getSig0() override { return sigma0; };
    std::vector<double*> state() override { return u; };
    
    double L, rho, A, T, E, I, cSq, kappaSq, sigma0, sigma1, lambdaSq, muSq, h, k;
    int N;
    std::vector<double*> u;
    bool excitationFlag = false;
private:
    
    // An (N+1) x 3 'matrix' containing the state of the system at all time-steps
    std::vector<std::vector<double>> uStates;
    
    /* Scheme variables
        - Adiv for u^{n+1} (that all terms get divided by)
        - B for u^n
        - C for u^{n-1}
        - S for precalculated sigma terms
    */
    double Adiv, B0, Bss, B1, B2, C0, C1, S0, S1;
    double excitationLoc = 0.9;
    
    bool clamped = true;
    
    JUCE_DECLARE_NON_COPYABLE_WITH_LEAK_DETECTOR (SimpleString)
};
