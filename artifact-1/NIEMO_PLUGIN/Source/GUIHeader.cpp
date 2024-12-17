/*
  ==============================================================================

    GUIHeader.cpp
    Created: 25 Sep 2024 10:43:33am
    Author:  Levin

  ==============================================================================
*/

#include <JuceHeader.h>
#include "GUIHeader.h"

//==============================================================================
GUIHeader::GUIHeader()
{
//    appTitle.setText("NIEMO", juce::NotificationType::dontSendNotification);
//    appTitle.setColour(juce::Label::textColourId, juce::Colour::fromString("FFffdd59"));
//    addAndMakeVisible(appTitle);
}

GUIHeader::~GUIHeader()
{
}

void GUIHeader::paint (juce::Graphics& g)
{
    g.setColour(juce::Colour::fromString("FF161d23"));
    g.fillAll();
    // drop shadow
    g.setColour (juce::Colour::fromString("FFd2dae2"));
    g.setOpacity(0.48);
    g.setFont (juce::FontOptions (28.0f, juce::Font::bold));
    g.drawText ("NIEMO", getLocalBounds().reduced(11).removeFromTop(26),
                juce::Justification::centredLeft, true);
    // Actual title
    g.setColour (juce::Colour::fromString("FFffd32a"));
    g.setFont (juce::FontOptions (28.0f, juce::Font::bold));
    g.drawText ("NIEMO", getLocalBounds().reduced(10),
                juce::Justification::centredLeft, true);
    
//    g.setColour (juce::Colour::fromString("FFffc048"));
//    g.drawLine(getLocalBounds().getBottomLeft().x, getLocalBounds().getBottomLeft().y, getLocalBounds().getBottomRight().x, getLocalBounds().getBottomRight().y, 2);
}

void GUIHeader::resized()
{
    // This method is where you should set the bounds of any child
    // components that your component contains..

}
