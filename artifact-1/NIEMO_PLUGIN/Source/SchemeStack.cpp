/*
  ==============================================================================

    SchemeStack.cpp
    Created: 16 Sep 2024 1:49:59pm
    Author:  Levin

  ==============================================================================
*/

#include "SchemeStack.h"

void SchemeStack::prepareToPlay(double sampleRate)
{
    this->sampleRate = sampleRate;
    double r = 0.0005;
    schemeParams.set ("L", 0.6);
    schemeParams.set ("rho", 7850);
    schemeParams.set ("A", r * r * juce::MathConstants<double>::pi);
    schemeParams.set ("T", 299.75);
    schemeParams.set ("E", 2e11);
    schemeParams.set ("r", r);
    schemeParams.set ("I", r * r * r * r * juce::MathConstants<double>::pi * 0.25);
    schemeParams.set ("sigma0", 2);
    schemeParams.set ("sigma1", 0.003);
}

void SchemeStack::createStack(int numSchemes)
{
    jassert(numSchemes > 0);
    schemeGains = new float[numSchemes]();
    feedbackGains = new float[numSchemes]();
    feedbackAlphas = new float[numSchemes]();
    connectionForces = new float[numSchemes]();
    for (int i = 0; i < numSchemes; ++i)
    {
        schemes.add(new DynamicStiffString(apvts, i));
        schemes.getLast()->prepareToPlay(sampleRate, schemeParams);
        if (i > 0)
        {
            DynamicStiffString * scheme1 = schemes[i-1];
            DynamicStiffString * scheme2 = schemes.getLast();
            connections.add(new SchemeConnection(*scheme1, *scheme2));
            connections.getLast()->prepareToPlay(sampleRate);
        }
        feedbackConnections.add(new SchemeConnection(*schemes.getLast(), *schemes.getLast(), false, 0.00));
        feedbackConnections.getLast()->prepareToPlay(sampleRate);
        feedbackConnections.getLast()->setForces(1.0, 1.0);
        etc.add(new ETC(128));
        lpFilters.add(new BiquadLowPassFilter());
        lpFilters.getLast()->setFilterParameters(10, sampleRate);
    }
    exciteConnection = std::make_unique<ExcitationConnection>();
    exciteConnection->prepareToPlay(sampleRate, *schemes.getFirst());
}

void SchemeStack::processStackBlock(juce::AudioBuffer<float>& buffer)
{
    auto writeLeft = buffer.getWritePointer(0);
    auto writeRight = buffer.getWritePointer(1);
    
    alphaMax = apvts.getParameter(ParameterIDs::getSchemeParameter(ParameterIDs::FEEDBACK_CHAOS, 0))->getNormalisableRange().end;
    phi = 1.2;
    
    for ( int i = 0; i < schemes.size(); ++i)
    {
        feedbackAlphas[i] = (alphaMax - apvts.getRawParameterValue(ParameterIDs::getSchemeParameter(ParameterIDs::FEEDBACK_CHAOS, i))->load()) * 10.f;
        schemeGains[i] = apvts.getRawParameterValue(ParameterIDs::getSchemeParameter(ParameterIDs::OUT_GAIN, i))->load();
        feedbackGains[i] = apvts.getRawParameterValue(ParameterIDs::getSchemeParameter(ParameterIDs::FEEDBACK_GAIN, i))->load();
        connectionForces[i] = apvts.getRawParameterValue(ParameterIDs::getSchemeParameter(ParameterIDs::SEND_CHANNEL, i))->load();
    }
    
    connections.getFirst()->setForces(connectionForces[0], connectionForces[1]);
    
    for (int i = 0; i < buffer.getNumSamples(); ++i)
    {
        processStack(i);
        writeLeft[i] = writeRight[i] = getOutput();
    }
}

void SchemeStack::processStack(int sampleNo)
{
    for ( auto& scheme : schemes)
    {
        scheme->setDecay(adsr->getDamping());
        scheme->updateParams();
        scheme->refreshCoefficients();
        scheme->calculateScheme();
    }
    float amplitude = 1.0;
    float lambda = 1.5;
    float excitationForce = getExponentialDecayBurst(amplitude, lambda, sampleNo);
    exciteConnection->applyExcitation(excitationForce);
    for (int i = 0; i < connections.size(); ++i)
    {
        connections[i]->updateConnectionPoint();
    }
    for (int i = 0; i < feedbackConnections.size(); ++i)
    {
        etc[i]->process(feedbackConnections[i]->getScheme1ConnectionPointOutput());
        feedbackConnections[i]->setFeedbackSchemeWeight(abs(updateFeedbackGain(i) * 0.0633));
        feedbackConnections[i]->updateConnectionPoint();
    }
    for ( auto& scheme : schemes)
    {
        scheme->forwardTimeStep();
    }
}

double SchemeStack::getOutput()
{
    double out = 0.0;
    for (int schemeId = 0; schemeId < schemes.size(); ++schemeId)
    {
        out +=  schemeGains[schemeId] * schemes[schemeId]->getOutput();
    }
    return out;
}

float SchemeStack::updateFeedbackGain(int schemeId)
{
    double s = std::min(1.0, std::pow((1.0 - etc[schemeId]->getETCVal()) * feedbackAlphas[schemeId], phi));
    double g = lpFilters[schemeId]->processSample(1.0 - s);
    return g * feedbackGains[schemeId];
}

float SchemeStack::getExponentialDecayBurst(double amplitude, double lambda, int sampleNo)
{
    float exponentialDecay = amplitude * std::exp(-lambda * adsr->getBuffer()[sampleNo]);
    return exponentialDecay * adsr->getBuffer()[sampleNo];
}
