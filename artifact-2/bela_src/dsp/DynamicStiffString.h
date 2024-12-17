//Adapted from: https://github.com/SilvinWillemsen/ModularVST

#pragma once

#include <map>
#include <vector>
#include <string>
#include <iostream>
#include <cmath>

//==============================================================================
/*
*/
class DynamicStiffString
{
public:
    DynamicStiffString() : schemeId(0) {};
    ~DynamicStiffString() = default;
    
    void prepareToPlay(float sampleRate, float L, float rho, float r, float T, float E, float sigma0, float sigma1);
    
    void calculateScheme();
    void forwardTimeStep();
    
    void refreshParameter (int changedParameterIdx, float changedParameterValue);
    
    void refreshCoefficients (bool init = false);
    
    // return u at the current sample at a location given by the length ratio
    float getOutput(float Lratio)
    {
        return v[1][static_cast<int>(round(N * Lratio))];
    }
    
    void excite (int loc = -1, float adsrValue = 1.f);
    
    bool shouldExcite() { return excitationFlag; };
    void exciteNextBuffer() { excitationFlag = true ;};
    
    void addRemovePoint();
    void refreshCustomIp();
    
    int getN() { return N; };
    float getL() { return L; };
    
    float getState(int loc, int timeIdx) { return v[timeIdx][loc]; }
    std::vector<float> getFullState() { return vStates[0]; }
    void applyForceAt(int loc, int timeIdx, float value) { v[timeIdx][loc] += value; };
    float getConnectionCoefficient() { return connectionCoefficient; };
    void setFrequency(float frequency) { 
		if (frequency >= 100.f && frequency <= 1000.f)
		{
	    	float newL = (1.f / (2.f * frequency)) * std::sqrt(T / mu);
    		freq = (1.0 / (2.0 * newL)) * std::sqrt(T / mu);;
			refreshParameter(0, newL); 
		}
    };
    void setE(float E) { 
		refreshParameter(4, E);
    };
    void setSigma0(float sig0) { 
		refreshParameter(5, sig0);
    };
    void setSigma1(float sig1) { 
		refreshParameter(6, sig1);
    };
	void setR(float r) { 
		refreshParameter(2, r);
    };
	void setRHO(float rho) { 
		refreshParameter(1, rho);
    };
    void setDecay(float decay) { refreshParameter(5, decay); };
    int getSchemeId() { return schemeId;};
    float getF0()
    {
    	return freq;
    };
    
private:
    
    void updateConnectionCoefficient();
    
    // Model parameters
    float L, rho, r, A, T, E, I, cSq, kappaSq, sigma0, sigma1, lambdaSq, muSq, h, k, freq, mu;
    std::vector<float*> parameterPtrs;
    std::vector<float> parametersToGoTo;
    std::vector<bool> parameterChanged;
    float connectionCoefficient;

    // Number of intervals (N+1 is number of points including boundaries)
    int N, Nmax, Nprev = 0;
    
    // Number of intervals of subsystems
    int Mv;
    const int Mw = 1; // Mw is static
    
    // Fractional number of intervals used for dynamic grid
    float Nfrac, NfracPrev;
    float alf, Iterm, A0, A1, A2, A3, AA;
    
    // (N+1) x 3 'matrices' containing the state of the left and right system at all time-steps
    std::vector<std::vector<float>> vStates;
    std::vector<std::vector<float>> wStates;

    // vectors of pointers that point to state vectors
    std::vector<float*> v;
    std::vector<float*> w;

    /* Scheme variables
        - Adiv for u^{n+1} (that all terms get divided by)
        - B for u^n
        - C for u^{n-1}
        - S for precalculated sigma terms
    */
    float Adiv, B0, Bss, B1, B2, C0, C1, S0, S1;
    
    // flag to tell MainComponent whether to excite the scheme or not
    bool excitationFlag = false;
    
    // initialise location of excitation
    float excitationLoc = 0.22;
    
    std::vector<float> customIp;
    
    static constexpr float sig1min = 0.0002;
    static constexpr float NmaxChange = 1.0 / 20.0;
    
    int schemeId;
};
