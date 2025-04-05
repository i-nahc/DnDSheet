import QtQuick 2.15
import QtQuick.Effects

Item {
    id: menuOptionParent
    property bool textOnly: false
    property string imageSrc: "qrc:/UI/assets/wallpapers/dragon.jpg"
    property int iconWidth: 100
    property int iconHeight: 100
    property int iconX: 100
    property int iconY: 100
    property string associatedPage: ""

    property int imageCropX: 100
    property int imageCropY: 100
    property int imageCropOffsetX: 0
    property int imageCropOffsetY: 0

    width: iconWidth
    height: iconHeight
    x: iconX
    y: iconY

    Image{
        id: iconImage
        anchors.centerIn: parent
        width: parent.width
        height: parent.height
        sourceClipRect: Qt.rect(imageCropOffsetX,
                                imageCropOffsetY,
                                imageCropX,
                                imageCropY)
        source: imageSrc
        visible: false
    }

    // --- MASKING --- //
    MultiEffect{
        source: iconImage
        anchors.fill: iconImage
        maskEnabled: true
        maskSource: mask
        maskThresholdMin: 0.5
        maskSpreadAtMin: 1.0

    }

    Item{
        id: mask
        width: iconImage.width
        height: iconImage.height
        layer.enabled: true
        visible: false
        Rectangle{
            width: parent.width
            height: parent.height
            radius: width/10
            layer.smooth: true
            color: "black"
        }
    }
}
