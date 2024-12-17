/*
  ==============================================================================

    GUIHeader.h
    Created: 25 Sep 2024 10:43:33am
    Author:  Levin

  ==============================================================================
*/

#pragma once

#include <JuceHeader.h>

//==============================================================================
/*
*/
class GUIHeader  : public juce::Component
{
public:
    GUIHeader();
    ~GUIHeader() override;

    void paint (juce::Graphics&) override;
    void resized() override;

private:
    JUCE_DECLARE_NON_COPYABLE_WITH_LEAK_DETECTOR (GUIHeader)
    
    juce::Label appTitle;
};
