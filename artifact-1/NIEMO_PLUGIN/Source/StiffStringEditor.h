/*
  ==============================================================================

    StiffStringEditor.h
    Created: 14 Sep 2024 3:49:02pm
    Author:  Levin

  ==============================================================================
*/

#pragma once

#include <JuceHeader.h>
#include "PluginProcessor.h"
#include "LabeledSlider.h"

using namespace juce;

//==============================================================================
/*
*/
class StiffStringEditor  : public juce::Component
{
public:
    StiffStringEditor(int schemeId, AudioProcessorValueTreeState &apvts);
    ~StiffStringEditor() override;

    void paint (juce::Graphics&) override;
    void resized() override;
    void createSliders();
    void createSections();

private:
    
    juce::String getChannelName(bool reverse)
    {
        if (reverse)
        {
            return (schemeId == 0) ? ("B") : ("Aa");
        }
        return (schemeId == 0) ? ("A") : ("B");
    }
    
    AudioProcessorValueTreeState& apvts;
    int schemeId;

    OwnedArray<LabeledSlider> schemeSliders;
    OwnedArray<LabeledSlider> feedbackSliders;
    OwnedArray<LabeledSlider> outputSliders;
    Label outputSectionLabel;
    Label soundSectionLabel;
    Label feedbackSectionLabel;
    TextButton exciteButton;
    
    JUCE_DECLARE_NON_COPYABLE_WITH_LEAK_DETECTOR (StiffStringEditor)
};
