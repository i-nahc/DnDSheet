import QtQuick
import QtQuick.Effects
import QtQuick.Controls.Material
import Qt5Compat.GraphicalEffects

Item {
    id: menuOptionParent
    property string imageDir: "qrc:/UI/assets/wallpapers"
    property string imageSrc: ""

    property string associatedPage: ""

    property int xOffset: 0
    property int yOffset: 0

    property double imageScale: 1

    property int sourceWidth: 0
    property int sourceHeight: 0

    property int labelHeight: parent.width/10
    property string labelText: "PLACEHOLDER"

    width: parent.width
    height: parent.height

    Rectangle{
        id: mask
        anchors.fill: parent
        radius: Material.SmallScale
        visible: false
        layer.enabled: true
        layer.smooth: true
        width: imageItem.width
        height: imageItem.height
        scale: 1
    }
    Rectangle
    {
        id: img
        anchors.fill: parent

        // Place the image within a rectangle/item and then target the rectangle for masking to keep image fill and positioning
        Image{
            id: imageItem
            source: imageDir + imageSrc
            anchors.fill: parent
            scale: 1
            fillMode: Image.PreserveAspectCrop
            sourceClipRect: Qt.rect(xOffset, yOffset, sourceWidth, sourceHeight)

        }
        visible: false
        layer.enabled: true
    }
    MultiEffect{
        source: img
        anchors.fill: img
        maskEnabled: true
        maskSource: mask
        maskThresholdMin: 0.5
        maskSpreadAtMin: 1.0
    }
    Rectangle{
        id: optionName
        anchors.bottom: parent.bottom
        bottomLeftRadius: Material.SmallScale-2
        bottomRightRadius: Material.SmallScale-2
        color: Style.primaryColorDark
        height: labelHeight
        width: parent.width
        opacity: 0.95

        Text{
            text: labelText
            width: parent.width
            height: parent.height
            horizontalAlignment: Text.AlignHCenter
            anchors.centerIn: parent
            fontSizeMode: Text.Fit
            font.family: Style.primaryFont.name
            color: "white"
            font.bold: true
            minimumPixelSize: 6
            font.pixelSize: 72

        }
    }


    HoverHandler{
        onHoveredChanged: {
            if(hovered)
            {
                focus.running = true
            }
            else
            {
                defocus.running = true
            }
        }
    }

    MouseArea{
        id: clickArea
        anchors.fill: parent
        acceptedButtons: Qt.LeftButton
        onPressed: {
            clickedAnim.running = true
        }
        onReleased: {
            focus.running = true
        }

        onClicked: {

            windowManager.triggerMenuItem(associatedPage)
        }
    }

    ParallelAnimation{
        id: focus
        NumberAnimation{
            target: imageItem
            properties: "scale"
            to: 1.1; duration: 200
        }
    }
    ParallelAnimation{
        id: defocus
        NumberAnimation{
            target: imageItem
            properties: "scale"
            to: 1; duration: 200
        }
    }
    ParallelAnimation{
        id: clickedAnim
        NumberAnimation{
            target: imageItem
            properties: "scale"
            to: 1.2; duration: 100
        }
    }
}
