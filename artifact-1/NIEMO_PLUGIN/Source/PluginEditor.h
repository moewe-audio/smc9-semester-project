/*
  ==============================================================================

    This file contains the basic framework code for a JUCE plugin editor.

  ==============================================================================
*/

#pragma once

#include <JuceHeader.h>
#include "PluginProcessor.h"
#include "StiffStringEditor.h"
#include "AppTheme.h"
#include "GUIHeader.h"
#include "ADSREditor.h"

//==============================================================================
/**
*/
class NIEMO_PLUGINAudioProcessorEditor  : public juce::AudioProcessorEditor
{
public:
    NIEMO_PLUGINAudioProcessorEditor (NIEMO_PLUGINAudioProcessor&);
    ~NIEMO_PLUGINAudioProcessorEditor() override;

    //==============================================================================
    void paint (juce::Graphics&) override;
    void resized() override;

private:
    
    // This reference is provided as a quick way for your editor to
    // access the processor object that created it.
    NIEMO_PLUGINAudioProcessor& audioProcessor;
    
    AppTheme theme;
    GUIHeader header;
    StiffStringEditor stiffStringEditor1;
    StiffStringEditor stiffStringEditor2;
    ADSREditor adsr;

    JUCE_DECLARE_NON_COPYABLE_WITH_LEAK_DETECTOR (NIEMO_PLUGINAudioProcessorEditor)
};
