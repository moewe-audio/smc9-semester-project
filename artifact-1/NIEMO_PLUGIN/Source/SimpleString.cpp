/*
  ==============================================================================

    SimpleString.cpp
    Created: 7 Sep 2024 8:57:05pm
    Author:  Levin

  ==============================================================================
*/

#include "SimpleString.h"
#include "JuceHeader.h"
#include <vector>

#define PI juce::MathConstants<double>::pi

void SimpleString::prepareToPlay(double sampleRate, int samplesPerBlock, juce::NamedValueSet& parameters)
{
    L = *parameters.getVarPointer("L");
    rho = *parameters.getVarPointer("rho");
    A = *parameters.getVarPointer("A");
    T = *parameters.getVarPointer("T");
    E = *parameters.getVarPointer("E");
    I = *parameters.getVarPointer("I");
    sigma0 = *parameters.getVarPointer ("sigma0");
    sigma1 = *parameters.getVarPointer ("sigma1");
    k = 1.0 / sampleRate;
    // Calculate wave speed (squared)
    cSq = T / (rho * A);
    
    // Calculate stiffness coefficient (squared)
    kappaSq = E * I / (rho * A);

    double stabilityTerm = cSq * k * k + 4.0 * sigma1 * k; // just easier to write down below
    
    h = sqrt (0.5 * (stabilityTerm + sqrt ((stabilityTerm * stabilityTerm) + 16.0 * kappaSq * k * k)));
    N = floor (L / h);
    h = L / N; // recalculate h
    
    lambdaSq = cSq * k * k / (h * h);
    muSq = kappaSq * k * k / (h * h * h * h);
    
    // Initialise vectors
    uStates = std::vector<std::vector<double>> (3,
                                        std::vector<double>(N+1, 0));
    
    /*  Make u pointers point to the first index of the state vectors.
        To use u (and obtain a vector from the state vectors) use indices like u[n][l] where,
             - n = 0 is u^{n+1},
             - n = 1 is u^n, and
             - n = 2 is u^{n-1}.
        Also see calculateScheme()
     */
    
    // Initialise pointer vector
    u.resize (3, nullptr);
    
    // Make set memory addresses to first index of the state vectors.
    for (int i = 0; i < 3; ++i)
        u[i] = &uStates[i][0];
    
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
}

void SimpleString::applyOscillator(juce::AudioBuffer<float>& buffer)
{
    auto* leftChannel = buffer.getWritePointer(0);
    auto* rightChannel = buffer.getWritePointer(1);
    for (int i = 0; i < buffer.getNumSamples(); ++i)
    {
        calculateScheme();
        forwardTimeStep();

        leftChannel[i] = rightChannel[i] = getOutput(0.74);
    }
}

void SimpleString::calculateScheme()
{
    for (int l = 2; l < N-1; ++l) // clamped boundaries
        u[0][l] = B0 * u[1][l] + B1 * (u[1][l + 1] + u[1][l - 1]) + B2 * (u[1][l + 2] + u[1][l - 2])
                + C0 * u[2][l] + C1 * (u[2][l + 1] + u[2][l - 1]);
    
    u[0][1] = Bss * u[1][1] + B1 * (u[1][2] + u[1][0]) + B2 * u[1][3]
            + C0 * u[2][1] + C1 * (u[2][2] + u[2][0]);
    u[0][N-1] = Bss * u[1][N-1] + B1 * (u[1][N] + u[1][N-2]) + B2 * (u[1][N-3])
            + C0 * u[2][N-1] + C1 * (u[2][N] + u[2][N-2]);
}

void SimpleString::forwardTimeStep()
{
    double* uTmp = u[2];
    u[2] = u[1];
    u[1] = u[0];
    u[0] = uTmp;
}

void SimpleString::excite()
{
    double width = 10;
    int start = std::max (floor((N+1) * excitationLoc) - floor(width * 0.5), 1.0);

    for (int l = 0; l < width; ++l)
    {
        if (l+start > (clamped ? N - 2 : N - 1))
            break;
        
        u[1][l+start] += 0.5 * (1 - cos(2.0 * PI * l / (width-1.0)));
        u[2][l+start] += 0.5 * (1 - cos(2.0 * PI * l / (width-1.0)));
    }
    excitationFlag = false;
}
