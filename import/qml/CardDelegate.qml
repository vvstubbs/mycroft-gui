/*
 * Copyright 2021 by Aditya Mehra <aix.m@outlook.com>
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *    http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 */

import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12 as Controls
import org.kde.kirigami 2.12 as Kirigami
import QtGraphicalEffects 1.12

Delegate {
    id: root
    leftPadding: 0
    bottomPadding: 0
    topPadding: 0
    rightPadding: 0
    
    // Allows cards to set the background image of only the card
    // Allows setting a color overlay for card background
    property alias cardBackgoundBorderColor: cardBackgound.color
    property alias cardBackgroundOverlayColor: backgroundColor.color
    property alias cardBackgroundImage: backgroundImage.source
    
    // Cards always control the padding and actual card radius
    // This allows the card to be set as fullscreen or squared
    property int cardLeftPadding: 30
    property int cardRightPadding: 30
    property int cardTopPadding: 30
    property int cardBottomPadding: 35
    property int cardRadius: 20
    
    background: Rectangle {
        id: cardBackgound
        anchors.fill: parent
        color: "black"
        z: 1
            
        Image {
            id: backgroundImage
            anchors.fill: parent
            anchors.leftMargin: cardLeftPadding
            anchors.rightMargin: cardRightPadding
            anchors.topMargin: cardTopPadding
            anchors.bottomMargin: cardBottomPadding
            source: ""
            layer.enabled: true
            layer.effect: OpacityMask {
                maskSource: Rectangle {
                    width: backgroundImage.width
                    height: backgroundImage.height
                    visible: false
                    radius: cardRadius
                }
            }
        }
        
        Rectangle {
            id: backgroundColor
            anchors.fill: parent
            anchors.leftMargin: cardLeftPadding
            anchors.rightMargin: cardRightPadding
            anchors.topMargin: cardTopPadding
            anchors.bottomMargin: cardBottomPadding
            color: Qt.rgba(255, 255, 255, 0.5)
            radius: cardRadius
        }
    }

    contentItem: Controls.Control {
        z: 2
        // Make sure any content always fits inside the card content item
        anchors.fill: parent
        anchors.leftMargin: cardLeftPadding
        anchors.rightMargin: cardRightPadding
        anchors.topMargin: cardTopPadding
        anchors.bottomMargin: cardBottomPadding
    }
}