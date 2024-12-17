/*
  ==============================================================================

    StiffStringEditor.cpp
    Created: 14 Sep 2024 3:49:02pm
    Author:  Levin

  ==============================================================================
*/

#include <JuceHeader.h>
#include "StiffStringEditor.h"
#include "Utils.h"
#include "AppTheme.h"

//==============================================================================
StiffStringEditor::StiffStringEditor(int schemeId, AudioProcessorValueTreeState &apvts) : apvts(apvts), schemeId(schemeId)
{
    createSliders();
    createSections();
}

StiffStringEditor::~StiffStringEditor()
{
}

void StiffStringEditor::paint (juce::Graphics& g)
{
    g.setColour(juce::Colour::fromString("FF161d23"));
    g.fillRoundedRectangle(getLocalBounds().toFloat(), 15.f);
    g.setColour(juce::Colour::fromString("FF485460"));
    g.drawRoundedRectangle(getLocalBounds().toFloat(), 15.f, 3.f);
    int rectSize = 20;
    juce::Rectangle<float> channelIcon(getWidth() - rectSize - 10, 10, rectSize, rectSize);
    g.setColour(ThemeGlobals::CHANNEL_COLOR);
    g.fillRoundedRectangle(channelIcon, 5.f);
    g.setColour(juce::Colours::white);
    g.setFont(juce::FontOptions(18.0f, juce::Font::bold));
    g.drawText(getChannelName(false), channelIcon, juce::Justification::centred, true);
}

void StiffStringEditor::resized()
{
    FlexBox vBox;
    vBox.flexDirection = FlexBox::Direction::column;
    vBox.flexWrap = FlexBox::Wrap::noWrap;
    vBox.alignContent = FlexBox::AlignContent::flexStart;
    vBox.alignItems = FlexBox::AlignItems::stretch;
    vBox.justifyContent = FlexBox::JustifyContent::flexStart;

    vBox.items.add(FlexItem(outputSectionLabel).withHeight(30).withMargin({ 0, 0, 40, 0 }));

    FlexBox outputBox;
    outputBox.flexDirection = FlexBox::Direction::row;
    outputBox.flexWrap = FlexBox::Wrap::wrap;
    outputBox.alignContent = FlexBox::AlignContent::center;
    outputBox.alignItems = FlexBox::AlignItems::center;
    outputBox.justifyContent = FlexBox::JustifyContent::center;

    for (auto slider : outputSliders)
    {
        outputBox.items.add(FlexItem(*slider).withMinWidth(75).withMinHeight(75));
    }
    vBox.items.add(FlexItem(outputBox));

    vBox.items.add(FlexItem(soundSectionLabel).withMinHeight(30).withMargin({ 55, 0, 40, 0 }));

    FlexBox soundBox;
    soundBox.flexDirection = FlexBox::Direction::row;
    soundBox.flexWrap = FlexBox::Wrap::wrap;
    soundBox.alignContent = FlexBox::AlignContent::center;
    soundBox.alignItems = FlexBox::AlignItems::center;
    soundBox.justifyContent = FlexBox::JustifyContent::center;
    for (auto slider : schemeSliders)
    {
        soundBox.items.add(FlexItem(*slider).withMinWidth(75).withMinHeight(75));
    }
    vBox.items.add(FlexItem(soundBox).withHeight(75));

    vBox.items.add(FlexItem(feedbackSectionLabel).withHeight(30).withMargin({ 55, 0, 40, 0 }));

    FlexBox feedBackBox;
    feedBackBox.flexDirection = FlexBox::Direction::row;
    feedBackBox.flexWrap = FlexBox::Wrap::wrap;
    feedBackBox.alignContent = FlexBox::AlignContent::center;
    feedBackBox.alignItems = FlexBox::AlignItems::center;
    feedBackBox.justifyContent = FlexBox::JustifyContent::center;

    for (auto slider : feedbackSliders)
    {
        feedBackBox.items.add(FlexItem(*slider).withMinWidth(75).withMinHeight(75));
    }
    vBox.items.add(FlexItem(feedBackBox));

    // Perform layout on the main FlexBox
    vBox.performLayout(getLocalBounds().reduced(ThemeGlobals::MARGIN));
}


void StiffStringEditor::createSliders()
{
    schemeSliders.clearQuick(true);
    feedbackSliders.clearQuick(true);
    
    outputSliders.add(new LabeledSlider(ParameterIDs::getSchemeParameter(ParameterIDs::OUT_GAIN, schemeId), "Master", apvts));
    outputSliders.add(new LabeledSlider(ParameterIDs::getSchemeParameter(ParameterIDs::SEND_CHANNEL, schemeId), getChannelName(true), apvts));
    schemeSliders.add(new LabeledSlider(ParameterIDs::getSchemeParameter(ParameterIDs::RHO, schemeId), "Color", apvts));
    schemeSliders.add(new LabeledSlider(ParameterIDs::getSchemeParameter(ParameterIDs::E, schemeId), "Resonance", apvts));
    schemeSliders.add(new LabeledSlider(ParameterIDs::getSchemeParameter(ParameterIDs::SIGMA1, schemeId), "Cutoff", apvts));
    feedbackSliders.add(new LabeledSlider(ParameterIDs::getSchemeParameter(ParameterIDs::FEEDBACK_GAIN, schemeId), "Feedback Gain", apvts));
    feedbackSliders.add(new LabeledSlider(ParameterIDs::getSchemeParameter(ParameterIDs::FEEDBACK_CHAOS, schemeId), "Chaos", apvts));
    
    for (auto slider : feedbackSliders)
    {
        addAndMakeVisible(slider);
    }
    
    for (auto slider : schemeSliders)
    {
        addAndMakeVisible(slider);
    }
    for (auto slider : outputSliders)
    {
        addAndMakeVisible(slider);
    }
}

void StiffStringEditor::createSections()
{
    outputSectionLabel.setText("Sends", dontSendNotification);
    outputSectionLabel.setJustificationType(Justification::centredLeft);
//    outputSectionLabel.setColour(Label::textColourId, ThemeGlobals::LIGHT_RED);
    soundSectionLabel.setText("Sound", dontSendNotification);
    soundSectionLabel.setJustificationType(Justification::centredLeft);
//    soundSectionLabel.setColour(Label::textColourId, ThemeGlobals::LIGHT_RED);
    feedbackSectionLabel.setText("Feedback", dontSendNotification);
    feedbackSectionLabel.setJustificationType(Justification::centredLeft);
//    feedbackSectionLabel.setColour(Label::textColourId, ThemeGlobals::LIGHT_RED);
    addAndMakeVisible(outputSectionLabel);
    addAndMakeVisible(soundSectionLabel);
    addAndMakeVisible(feedbackSectionLabel);
}
