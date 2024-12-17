/*
  ==============================================================================

    LabeledSlider.h
    Created: 5 Oct 2024 11:09:46am
    Author:  Levin

  ==============================================================================
*/

#pragma once

#include <JuceHeader.h>

//==============================================================================
/*
*/
class LabeledSlider  : public juce::Component
{
public:
    LabeledSlider(juce::String paramId, juce::String paramDisplayText, juce::AudioProcessorValueTreeState &apvts)
    {
        addAndMakeVisible(slider);
        addAndMakeVisible(label);
        label.setText(paramDisplayText, juce::dontSendNotification);
        label.setJustificationType(juce::Justification::centred);
        label.setFont(juce::FontOptions(14.0f));
        slider.setTextBoxStyle(Slider::TextEntryBoxPosition::NoTextBox, true, 0, 0);
        slider.setSliderStyle(Slider::RotaryHorizontalVerticalDrag);
        attachment = std::make_unique<juce::AudioProcessorValueTreeState::SliderAttachment>(apvts, paramId, slider);
    }

    ~LabeledSlider() override
    {
    }

    void paint (juce::Graphics& g) override
    {

    }

    void resized() override
    {
        auto area = getLocalBounds();
        slider.setBounds(area.removeFromTop(60));
        label.setBounds(area.removeFromTop(15));
    }

    juce::Slider slider = Slider(Slider::LinearVertical, Slider::TextBoxBelow);
    juce::Label label;
    std::unique_ptr<AudioProcessorValueTreeState::SliderAttachment> attachment;
    
private:
    JUCE_DECLARE_NON_COPYABLE_WITH_LEAK_DETECTOR (LabeledSlider)
};
