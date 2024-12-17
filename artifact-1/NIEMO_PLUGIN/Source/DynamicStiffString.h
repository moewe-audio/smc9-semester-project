/*
  ==============================================================================

    DynamicStiffString.cpp
    Created: 14 Sep 2024 5:01:32pm
    Author:  Levin Schnabel
    Adapted from: https://github.com/SilvinWillemsen/ModularVST

  ==============================================================================
*/

#pragma once

#include <JuceHeader.h>

using namespace juce;
//==============================================================================
/*
*/
class DynamicStiffString
{
public:
    DynamicStiffString( AudioProcessorValueTreeState& apvts, int schemeId ) : schemeId(schemeId), apvts(apvts) { };
    ~DynamicStiffString() = default;
    
    void prepareToPlay(double sampleRate, juce::NamedValueSet& parameters);

    
    void calculateScheme();
    void forwardTimeStep();
    
    void refreshParameter (int changedParameterIdx, double changedParameterValue);
    
    void refreshCoefficients (bool init = false);
    
    //return u at the current sample at a location given by the length ratio

    double getOutput()
    {
        return v[1][6]; // set to be fixed due to varying N
    }
    
    void excite (int loc = -1, float adsrValue = 1.f);
    
    bool shouldExcite() { return excitationFlag; };
    void exciteNextBuffer() { excitationFlag = true ;};
    
    void addRemovePoint();
    void refreshCustomIp();
    
    void applyOscillator(juce::AudioBuffer<float>& buffer);
    
    void updateParams();
    
    int getN() { return N; };
    
    double getState(int loc, int timeIdx) { return v[timeIdx][loc]; };
    void applyForceAt(int loc, int timeIdx, double value) { v[timeIdx][loc] += value; };
    double getConnectionCoefficient() { return connectionCoefficient; };
    void setFrequency(float freq) { refreshParameter(7, freq); };
    void setDecay(float decay) { refreshParameter(5, decay); };
    int getSchemeId() { return schemeId;};
    
private:
    
    void updateConnectionCoefficient();
    
    // Model parameters
    double L, rho, r, A, T, E, I, cSq, kappaSq, sigma0, sigma1, lambdaSq, muSq, h, k, freq;
    std::vector<double*> parameterPtrs;
    std::vector<double> parametersToGoTo;
    std::vector<bool> parameterChanged;
    double connectionCoefficient;

    // Number of intervals (N+1 is number of points including boundaries)
    int N, Nmax, Nprev = 0;
    
    // Number of intervals of subsystems
    int Mv;
    const int Mw = 1; // Mw is static
    
    // Fractional number of intervals used for dynaic grid
    double Nfrac, NfracPrev;
    double alf, Iterm, A0, A1, A2, A3, AA;
    
    // (N+1) x 3 'matrices' containing the state of the left and right system at all time-steps
    std::vector<std::vector<double>> vStates;
    std::vector<std::vector<double>> wStates;

    // vectors of pointers that point to state vectors
    std::vector<double*> v;
    std::vector<double*> w;

    /* Scheme variables
        - Adiv for u^{n+1} (that all terms get divided by)
        - B for u^n
        - C for u^{n-1}
        - S for precalculated sigma terms
    */
    double Adiv, B0, Bss, B1, B2, C0, C1, S0, S1;
    
    // flag to tell MainComponent whether to excite the scheme or not
    bool excitationFlag = false;
    
    // initialise location of excitation
    double excitationLoc = 0.22;
    
    bool clamped = true;
    
    std::vector<double> customIp;
    
    static constexpr double sig1min = 0.0002;
    static constexpr double NmaxChange = 1.0 / 20.0;
    
    int schemeId;
    AudioProcessorValueTreeState& apvts;
    
    JUCE_DECLARE_NON_COPYABLE_WITH_LEAK_DETECTOR (DynamicStiffString)
};
