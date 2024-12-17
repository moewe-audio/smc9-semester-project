/*
  ==============================================================================

    Utils.h
    Created: 16 Sep 2024 8:39:37pm
    Author:  Levin

  ==============================================================================
*/

#pragma once

namespace ParameterIDs {
    inline const juce::String SIGMA0 = "SIGMA_0";
    inline const juce::String E = "E";
    inline const juce::String T = "T";
    inline const juce::String L = "L";
    inline const juce::String SIGMA1 = "SIGMA_1";
    inline const juce::String R = "R";
    inline const juce::String RHO = "RHO";
    inline const juce::String SCHEME_FREQ = "SCHEME_FREQUENCY";
    inline const juce::String FEEDBACK_CHAOS = "FEEDBACK_CHAOS";
    inline const juce::String FEEDBACK_EXPONENT = "FEEDBACK_EXPONENT";
    inline const juce::String FEEDBACK_SMOOTHING = "FEEDBACK_SMOOTHING";
    inline const juce::String ADSR_ATTACK = "ADSR_ATTACK";
    inline const juce::String ADSR_DECAY = "ADSR_DECAY";
    inline const juce::String ADSR_SUSTAIN = "ADSR_SUSTAIN";
    inline const juce::String ADSR_RELEASE = "ADSR_RELEASE";
    inline const juce::String OUT_GAIN = "OUT_GAIN";
    inline const juce::String SEND_CHANNEL = "SEND_CHANNEL";
    inline const juce::String FEEDBACK_GAIN = "FEEDBACK_GAIN";


    inline const juce::Array<juce::String> SCHEME_PARAMETERS = {
        L,
        RHO,
        R,
        T,
        E,
        SIGMA0,
        SIGMA1,
        SCHEME_FREQ
    };

    inline const juce::Array<juce::String> SCHEME_USER_PARAMETERS = {
        RHO,
        E,
        SIGMA1
    };

    inline juce::String getSchemeParameter(juce::String param, int schemeId)
    {
        return param + "_" + std::to_string(schemeId);
    }
}
