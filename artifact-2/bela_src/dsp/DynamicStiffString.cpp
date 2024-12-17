/*
  ==============================================================================

    DynamicStiffString.cpp
    Created: 14 Sep 2024 5:01:32pm
    Author:  Levin Schnabel
    Adapted from: https://github.com/SilvinWillemsen/ModularVST

  ==============================================================================
*/

#include <map>
#include <vector>
#include <cmath>
#include "DynamicStiffString.h"
#include <random>
#include <iostream>

//==============================================================================
void DynamicStiffString::prepareToPlay(float sampleRate, float L, float rho, float r, float T, float E, float sigma0, float sigma1)
{
    this->k = 1.0 / sampleRate;
    this->L = L;
    this->rho = rho;
    this->r = r;
    this->A = M_PI * r * r;
    this->T = T;
    this->E = E;
    this->I = M_PI * r * r * r * r * 0.25;
    this->sigma0 = sigma0;
    this->sigma1 = sigma1;
    this->freq = 100.0;
    this->mu = rho * A;
    
    parameterPtrs.reserve (8);
    parameterPtrs.push_back (&L);
    parameterPtrs.push_back (&rho);
    parameterPtrs.push_back (&r);
    parameterPtrs.push_back (&T);
    parameterPtrs.push_back (&E);
    parameterPtrs.push_back (&sigma0);
    parameterPtrs.push_back (&sigma1);
    parameterPtrs.push_back (&freq);  

    
    parametersToGoTo.resize (parameterPtrs.size(), 0);
    for (int i = 0; i < parameterPtrs.size(); ++i)
        parametersToGoTo[i] = *parameterPtrs[i];
    
    parameterChanged.resize (parameterPtrs.size(), false);
    
    float cSqMin = 0.5 * T / (2.0 * rho * 2.0 * r * 2.0 * r * M_PI);

    float hMin = sqrt(cSqMin * k * k + 4.0 * sig1min * k);
    Nmax = floor (2.0 * L / hMin);
    
    float rMax = 0.5 * r; //?
    float cSqMax = 2.0 * T / (0.5 * rho * rMax * rMax * M_PI);
    float kappaSqMax = 2.0 * E * M_PI *rMax * rMax * rMax * rMax * 0.25 / (0.5 * rho * rMax * rMax *M_PI);
    
    //float hMax = sqrt((cSqMax * k * k + 4.0 * sigma1 * 2.0 * k + sqrt(pow(cSqMax * k * k + 4.0 * sigma1 * 2.0 * k, 2) + 16 * kappaSqMax * k * k))/2.0);
    
    // only add to left system (v)
    int MvMax = Nmax - Mw;
    
    // Initialise vectors (excluding outer boundaries
    vStates = std::vector<std::vector<float>> (3,
                                        std::vector<float>(MvMax+1, 0));
    
    wStates = std::vector<std::vector<float>> (3,
                                        std::vector<float>(Mw+1, 0));

    /*  Make u pointers point to the first index of the state vectors.
        To use u (and obtain a vector from the state vectors) use indices like u[n][l] where,
             - n = 0 is u^{n+1},
             - n = 1 is u^n, and
             - n = 2 is u^{n-1}.
        Also see calculateScheme()
     */
    
    // Initialise pointer vector
    v.resize (3, nullptr);
    w.resize (3, nullptr);

    // Make set memory addresses to first index of the state vectors.
    for (int i = 0; i < 3; ++i)
    {
        v[i] = &vStates[i][0];
        w[i] = &wStates[i][0];
    }
    customIp.resize(4, 0);
    
    refreshCoefficients (true);
    
    Nprev = N;
    NfracPrev = Nfrac;
};

void DynamicStiffString::calculateScheme()
{
    
    // simply supported left boundary
    v[0][1] = Bss * v[1][1] + B1 * (v[1][2] + v[1][0]) + B2 * v[1][3]
            + C0 * v[2][1] + C1 * (v[2][2] + v[2][0]);
    
    // main left scheme
    for (int l = 2; l < Mv-1; ++l)
        v[0][l] = B0 * v[1][l] + B1 * (v[1][l + 1] + v[1][l - 1]) + B2 * (v[1][l + 2] + v[1][l - 2])
                + C0 * v[2][l] + C1 * (v[2][l + 1] + v[2][l - 1]);
    
    // inner boundary calculations
    A0 = Iterm * Iterm - 4.0 * Iterm + 6.0;
    A1 = Iterm - 4.0;
    A2 = -(Iterm * Iterm) + 4.0 * Iterm + 1.0;
    A3 = -Iterm;
    AA = Iterm - 2.0;
    
    if (Mw == 1)
    {
        // next-to-boundary point
        v[0][Mv-1] = (2.0 * v[1][Mv-1] - v[2][Mv-1]
                            + lambdaSq * (v[1][Mv] - 2.0 * v[1][Mv - 1] + v[1][Mv - 2])
                            - muSq * (v[1][Mv - 3] - 4 * v[1][Mv - 2] + 6 * v[1][Mv-1] + A1 * v[1][Mv] + w[1][0])
                            + S0 * v[2][Mv-1]
                            + S1 * (v[1][Mv] - 2.0 * v[1][Mv - 1] + v[1][Mv - 2])
                            - S1 * (v[2][Mv] - 2.0 * v[2][Mv - 1] + v[2][Mv - 2])) / (1.0 + S0);
        
        // boundary points
        v[0][Mv] = (2.0 * v[1][Mv]
                            + lambdaSq * (w[1][0] + AA * v[1][Mv] + v[1][Mv - 1])
                            - muSq * (v[1][Mv - 2] - 4 * v[1][Mv - 1] + A0 * v[1][Mv] + (A1 - A3) * w[1][0])
                            + (-1.0 + S0) * v[2][Mv]
                            + S1 * (w[1][0] + AA * v[1][Mv] + v[1][Mv - 1])
                            - S1 * (w[2][0] + AA * v[2][Mv] + v[2][Mv - 1])) / (1.0 + S0);

        // right system (single point now)
        w[0][0] = (2.0 * w[1][0]
                + lambdaSq * (A3 * v[1][Mv-1] + v[1][Mv] + AA * w[1][0]) // w[1][1] is 0
                - muSq * (A3 * v[1][Mv-2] + A2 * v[1][Mv-1] + A1 * v[1][Mv]
                          + (A0 - 1.0) * w[1][0])  // w[1][1] is 0
                + (-1.0 + S0) * w[2][0]
                + S1 * (A3 * v[1][Mv-1] + v[1][Mv] + AA * w[1][0])
                - S1 * (A3 * v[2][Mv-1] + v[2][Mv] + AA * w[2][0])) / (1.0 + S0);
    }
    else
    {
        // next-to-boundary point (left)
        v[0][Mv-1] = ((2.0 - 2.0 * lambdaSq - 6.0 * muSq - 2.0 * S1) * v[1][Mv-1]
                                + (lambdaSq + 4.0 * muSq + S1) * v[1][Mv-2]
                                + (lambdaSq - A1 * muSq + S1) * v[1][Mv]
                                - muSq * (v[1][Mv-3] + w[1][0] + A3 * w[1][1])
                                + (S0 + 2.0 * S1 - 1.0) * v[2][Mv-1]
                                - S1 * (v[2][Mv] + v[2][Mv-2])) / (1.0 + S0);
                
        // left inner boundary
        v[0][Mv] = ((2.0 + AA * (lambdaSq + S1) - A0 * muSq) * v[1][Mv]
                            + (lambdaSq + 4.0 * muSq + S1) * v[1][Mv-1]
                            + (lambdaSq - A1 * muSq + S1) * w[1][0]
                            + (A3 * lambdaSq - A2 * muSq + A3 * S1) * w[1][1]
                            - muSq * (v[1][Mv-2] + A3 * w[1][2])
                            + (S0 - AA * S1 - 1.0) * v[2][Mv]
                            - S1 * (v[2][Mv-1] + w[2][0] + A3 * w[2][1])) / (1.0 + S0);
                
        // right inner boundary
        w[0][0] = ((2.0 + AA * (lambdaSq + S1) - A0 * muSq) * w[1][0]
                            + (lambdaSq + 4.0 * muSq + S1) * w[1][1]
                            + (lambdaSq - A1 * muSq + S1) * v[1][Mv]
                            + (A3 * lambdaSq - A2 * muSq + A3 * S1) * v[1][Mv-1]
                            - muSq * (w[1][2] + A3 * v[1][Mv-2])
                            + (S0 - AA * S1 - 1.0) * w[2][0]
                            - S1 * (w[2][1] + v[2][Mv] + A3 * v[2][Mv-1])) / (1.0 + S0);
        
        if (Mw == 2)
        {
            // next-to-boundary point (right) + simply supported
            w[0][1] = (2.0 * w[1][1]
                    + lambdaSq * (w[1][0] - 2.0 * w[1][1] + w[1][2])
                       - muSq * (A3 * v[1][Mv-1] + v[1][Mv] + A1 * w[1][0] + 5.0 * w[1][1] - 4.0 * w[1][2])
                    + (-1.0 + S0) * w[2][1]
                    + S1 * (w[1][0] - 2.0 * w[1][1] + w[1][2])
                    - S1 * (w[2][0] - 2.0 * w[2][1] + w[2][2])) / (1.0 + S0);
        }
        else
        {
            // next-to-boundary point (right)
            w[0][1] = ((2.0 - 2.0 * lambdaSq - 6.0 * muSq - 2.0 * S1) * w[1][1]
                                    + (lambdaSq + 4.0 * muSq + S1) * w[1][2]
                                    + (lambdaSq - A1 * muSq + S1) * w[1][0]
                                    - muSq * (w[1][3] + v[1][Mv] + A3 * v[1][Mv-1])
                                    + (S0 + 2.0 * S1 - 1.0) * w[2][1]
                                    - S1 * (w[2][0] + w[2][2])) / (1.0 + S0);

            // main right scheme
            for (int l = 2; l < Mw-1; ++l)
                w[0][l] = B0 * w[1][l] + B1 * (w[1][l + 1] + w[1][l - 1]) + B2 * (w[1][l + 2] + w[1][l - 2])
                        + C0 * w[2][l] + C1 * (w[2][l + 1] + w[2][l - 1]);
            
            // simply supported right boundary
            w[0][Mw-1] = Bss * w[1][Mw-1] + B1 * (w[1][Mw-2] + w[1][Mw]) + B2 * w[1][Mw-3]
                + C0 * w[2][Mw-1] + C1 * (w[2][Mw-2] + w[2][Mw]);

        }
    }
};

void DynamicStiffString::forwardTimeStep()
{
    // Do a pointer-switch. MUCH quicker than copying two entire state vectors every time-step.
    float* vTmp = v[2];
    v[2] = v[1];
    v[1] = v[0];
    v[0] = vTmp;
    
    float* wTmp = w[2];
    w[2] = w[1];
    w[1] = w[0];
    w[0] = wTmp;

    NfracPrev = Nfrac;
    Nprev = N;

};

void DynamicStiffString::excite (int loc, float adsrValue)
{
    float width = 10;
    int start = (loc == -1) ? std::max(floor((N+1) * excitationLoc) - floor(width * 0.5), 1.0) : loc;
    for (int l = 0; l < width; ++l)
    {
        if (l + start > Mv)  // Ensure we don't go out of bounds
            break;
        
        // Calculate the raised cosine shape and scale it by the ADSR value
        float raisedCosine =  (1.0 - cos(2.0 * M_PI * l / (width - 1.0)));
        
        // Add the scaled excitation to the string's state vectors (v[1] and v[2])
        v[1][l + start] += adsrValue * raisedCosine;
        v[2][l + start] += adsrValue * raisedCosine;
    }
};

void DynamicStiffString::refreshParameter (int changedParameterIdx, float changedParameterValue)
{
	parametersToGoTo[changedParameterIdx] = changedParameterValue;
    parameterChanged[changedParameterIdx] = true;
};

void DynamicStiffString::refreshCoefficients (bool init)
{
    float paramDiffMax;
    float NfracNext;

    bool needsRefresh = false;
    for (int i = 0; i < parameterPtrs.size(); ++i)
    {
        // if parameter hasn't changed, continue to next
        if (!parameterChanged[i])
            continue;
        needsRefresh = true;
        // if (&L == parameterPtrs[i])
        if (i == 0) // L Changed
        {
            paramDiffMax = NmaxChange * h;
            
        }
        else if (i == 1) // RHO changed
        {
            // bigger rho means bigger N
            NfracNext = Nfrac + (*parameterPtrs[i] > parametersToGoTo[i] ? -1 : 1) * NmaxChange;

            paramDiffMax = fabs((k * k * L * L * NfracNext * NfracNext * T + 4.0 * I * k * k * NfracNext * NfracNext * NfracNext * NfracNext * E) / (A * L * L * (L * L - 4.0 * k * NfracNext * NfracNext * sigma1)) - rho);
        }
        else if (&T == parameterPtrs[i])
        {
            // bigger T means smaller N
            NfracNext = Nfrac + (*parameterPtrs[i] < parametersToGoTo[i] ? -1 : 1) * NmaxChange;
                
            paramDiffMax = fabs((-4.0 * A * k * L * L * NfracNext * NfracNext * rho * sigma1 + A * L * L * L * L * rho - 4.0 * I * k * k * NfracNext * NfracNext * NfracNext * NfracNext * E) / (k * k * L * L * NfracNext * NfracNext) - T);
        }
        else if (i == 2) // r changed
        {
            
            if (E != 0)
            {
                float NfracNextPlus = Nfrac + NmaxChange;
                float NfracNextMin = Nfrac - NmaxChange;

                
                float bCoeffPlus = (16.0 * L * L * sigma1 * k) / (NfracNextPlus * NfracNextPlus) - (4.0 * L*L*L*L)/(NfracNextPlus * NfracNextPlus * NfracNextPlus * NfracNextPlus);
                float bCoeffMin = (16.0 * L * L * sigma1 * k) / (NfracNextMin * NfracNextMin) - (4.0 * L*L*L*L)/(NfracNextMin * NfracNextMin * NfracNextMin * NfracNextMin);

                std::vector<float> rVals (4, 0);
                
                // The graph of N (y-axis) vs r (x-axis) is a negative parabola. For a change in N (either positive or negative, there are 4 possible r values. Here we're trying to find the one that corresponds to the one we're trying to find.
                
                // r right side of parabola, increasing N
                rVals[0] = sqrt((-bCoeffPlus + sqrt(bCoeffPlus * bCoeffPlus - 16.0 * E * k * k / rho * (4.0 * L*L * T * k*k) / (NfracNextPlus * NfracNextPlus * rho * M_PI)))/(8.0 * (E * k * k / rho)));
                // r right side of parabola, decreasing N
                rVals[1] = sqrt((-bCoeffMin + sqrt(bCoeffMin * bCoeffMin - 16.0 * E * k * k / rho * (4.0 * L*L * T * k*k) / (NfracNextMin * NfracNextMin * rho * M_PI)))/(8.0 * (E * k * k / rho)));
                
                // r left side of parabola, increasing N
                rVals[2] = sqrt((-bCoeffPlus - sqrt(bCoeffPlus * bCoeffPlus - 16.0 * E * k * k / rho * (4.0 * L*L * T * k*k) / (NfracNextPlus * NfracNextPlus * rho * M_PI)))/(8.0 * (E * k * k / rho)));
                
                // r left side of parabola, decreasing N
                rVals[3] = sqrt((-bCoeffMin - sqrt(bCoeffMin * bCoeffMin - 16.0 * E * k * k / rho * (4.0 * L*L * T * k*k) / (NfracNextMin * NfracNextMin * rho * M_PI)))/(8.0 * (E * k * k / rho)));
                
                float rDiff = 1;
                float rToGoTo = parametersToGoTo[i];
                int idxToChoose = -1;
                for (int i = 0; i < rVals.size(); ++i)
                {
                    if (std::isnan(rVals[i]))
                        continue;
                    // if r is decreased, don't choose larger r values
                    if (rToGoTo < r && rVals[i] > r)
                        continue;
                    
                    // if r is increased, don't choose smaller r values
                    if (rToGoTo > r && rVals[i] < r)
                        continue;
                    
                    if (fabs(rVals[i] - r) < rDiff)
                    {
                        rDiff = rVals[i] - r;
                        idxToChoose = i;
                    }
                }
            }
            else
            {
                // if E = 0, bigger r means bigger N
                NfracNext = Nfrac + (*parameterPtrs[i] > parametersToGoTo[i] ? -1 : 1) * NmaxChange;

                paramDiffMax = fabs((k * NfracNext * sqrt(T)) / (sqrt(rho) * sqrt(M_PI * L * L - 4.0 * M_PI * k * NfracNext * NfracNext * sigma1)) - r);
            }
            
        }
        else if (i == 4) // E changed
        {
            // bigger E means smaller N
            NfracNext = Nfrac + (*parameterPtrs[i] < parametersToGoTo[i] ? -1 : 1) * NmaxChange;
            paramDiffMax = fabs((-4.0 * A * k * L * L * NfracNext * NfracNext * rho * sigma1 + A * L * L * L * L * rho - k * k * L * L * NfracNext * NfracNext * T) / (4.0 * I * k * k * NfracNext * NfracNext * NfracNext * NfracNext) - E);

        }
        else if (i == 6) //sigma1 changed
        {
            // bigger sigma1 means smaller N
            NfracNext = Nfrac + (*parameterPtrs[i] < parametersToGoTo[i] ? -1 : 1) * NmaxChange;

            paramDiffMax = fabs((A * L * L * L * L * rho - k * k * L * L * NfracNext * NfracNext * T - 4.0 * I * k * k * NfracNext * NfracNext * NfracNext * NfracNext * E) / (4.0 * A * k * L * L * NfracNext * NfracNext * rho) - sigma1);

        }
        else if (i == 5 ) //sigma 0 changed
        {
            paramDiffMax = 100;
        }
        if (fabs(*parameterPtrs[i] - parametersToGoTo[i]) < paramDiffMax)
        {
        	*parameterPtrs[i] = parametersToGoTo[i];
        	if (i == 0)
        	{
        		L = *parameterPtrs[i];
        	}
        	if (i == 1)
        	{
        		rho = *parameterPtrs[i];
        	}
        	if (i == 2)
        	{
        		r = *parameterPtrs[i];
        	}
    		if (i == 4)
        	{
        		E = *parameterPtrs[i];
        	}
        	if (i == 5)
        	{
        		sigma0 = *parameterPtrs[i];
        	}
        	if (i == 6)
        	{
        		sigma1 = *parameterPtrs[i];
        	}
            parameterChanged[i] = false;
        }
        else if (*parameterPtrs[i] < parametersToGoTo[i])
        {
            *parameterPtrs[i]  += paramDiffMax;
    		if (i == 0)
        	{
        		L = *parameterPtrs[i];
        	}
        	if (i == 1)
        	{
        		rho = *parameterPtrs[i];
        	}
        	if (i == 2)
        	{
        		r = *parameterPtrs[i];
        	}
			if (i == 4)
        	{
        		E = *parameterPtrs[i];
        	}
        	if (i == 5)
        	{
        		sigma0 = *parameterPtrs[i];
        	}
        	if (i == 6)
        	{
        		sigma1 = *parameterPtrs[i];
        	}
        }
        else if (*parameterPtrs[i] > parametersToGoTo[i])
        {
            *parameterPtrs[i] -= paramDiffMax;
        	if (i == 0)
        	{
        		L = *parameterPtrs[i];
        	}
        	if (i == 1)
        	{
        		rho = *parameterPtrs[i];
        	}
        	if (i == 2)
        	{
        		r = *parameterPtrs[i];
        	}
    		if (i == 4)
        	{
        		E = *parameterPtrs[i];
        	}
        	if (i == 5)
        	{
        		sigma0 = *parameterPtrs[i];
        	}
        	if (i == 6)
        	{
        		sigma1 = *parameterPtrs[i];
        	}
        }
    }

    if (!needsRefresh && !init)
        return;
    A = M_PI * r * r;
    I = M_PI * r * r * r * r * 0.25;

    // Calculate wave speed (squared)
    cSq = T / (rho * A);
    
    // Calculate stiffness coefficient (squared)
    kappaSq = E * I / (rho * A);

    float stabilityTerm = cSq * k * k + 4.0 * sigma1 * k; // just easier to write down below
    
    h =  sqrt (0.5 * (stabilityTerm + sqrt ((stabilityTerm * stabilityTerm) + 16.0 * kappaSq * k * k)));
    Nfrac = L / h;

    // check if the change does not surpass a limit
    N = floor (Nfrac);
    alf = Nfrac - N;
    if (init)
        Nprev = N;
    
    // Check whether a grid point needs to be added or removed
    if (Nprev != N)
        addRemovePoint();
    
    Mv = N - Mw;
    
    Iterm = (alf - 1.0) / (alf + 1.0);
    
    lambdaSq = cSq * k * k / (h * h);
    muSq = kappaSq * k * k / (h * h * h * h);
    // Coefficients used for damping
    S0 = sigma0 * k;
    S1 = (2.0 * sigma1 * k) / (h * h);
    
    // Scheme coefficients
    B0 = 2.0 - 2.0 * lambdaSq - 6.0 * muSq - 2.0 * S1; // u_l^n
    Bss = 2.0 - 2.0 * lambdaSq - 5.0 * muSq - 2.0 * S1;
    B1 = lambdaSq + 4.0 * muSq + S1;                   // u_{l+-1}^n
    B2 = -muSq;                                        // u_{l+-2}^n
    C0 = -1.0 + S0 + 2.0 * S1;                         // u_l^{n-1}
    C1 = -S1;                                          // u_{l+-1}^{n-1}
    
    Adiv = 1.0 / (1.0 + S0);                           // u_l^{n+1}
    
    // Divide by u_l^{n+1} term
    B0 *= Adiv;
    Bss *= Adiv;
    B1 *= Adiv;
    B2 *= Adiv;
    C0 *= Adiv;
    C1 *= Adiv;
    
    this->mu = rho * A;
    
    updateConnectionCoefficient();
};

void DynamicStiffString::addRemovePoint()
{
    refreshCustomIp();
    if (N > Nprev)
    {
        // possibly unnecessary to update up[0]
        v[0][Mv + 1] = customIp[0] * v[0][Mv-1]
            + customIp[1] * v[0][Mv]
            + customIp[2] * w[0][0]
            + customIp[3] * w[0][1];
        
        v[1][Mv + 1] = customIp[0] * v[1][Mv-1]
            + customIp[1] * v[1][Mv]
            + customIp[2] * w[1][0]
            + customIp[3] * w[1][1];

        v[2][Mv + 1] = customIp[0] * v[2][Mv-1]
            + customIp[1] * v[2][Mv]
            + customIp[2] * w[2][0]
            + customIp[3] * w[2][1];

    } else {
        v[0][Mv] = 0;
        v[1][Mv] = 0;
        v[2][Mv] = 0;
    }
};

void DynamicStiffString::refreshCustomIp()
{
    customIp[0] = -alf * (alf + 1.0) / ((alf + 2.0) * (alf + 3.0));
    customIp[1] = 2.0 * alf / (alf + 2.0);
    customIp[2] = 2.0 / (alf + 2.0);
    customIp[3] = -2.0 * alf / ((alf + 3.0) * (alf + 2.0));
};


void DynamicStiffString::updateConnectionCoefficient()
{
    connectionCoefficient = k * k / (rho * A * h * (1.0 + sigma0 * k));
};
