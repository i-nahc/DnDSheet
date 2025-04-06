import QtQuick 2.15
import QtQuick.Effects
import QtQuick.Controls.Material
import Qt5Compat.GraphicalEffects

Item {
    id: menuOptionParent
    property string imageDir: "qrc:/UI/assets/wallpapers"
    property string imageSrc: ""

    property string associatedPage: ""

    property int cropXOffset: 0
    property int cropYOffset: 0

    property double imageScale: 1

    property int sourceWidth: 0
    property int sourceHeight: 0

    width: parent.width
    height: parent.height

    Rectangle{
        id: mask
        anchors.fill: parent
        radius: Material.SmallScale
        visible: false
        layer.smooth: true
        width: imageItem.width
        height: imageItem.height
        scale: 1
    }

    Image{
        id: imageItem
        source: imageDir + imageSrc
        anchors.fill: parent
        scale: 1
        fillMode: Image.PreserveAspectCrop
        sourceSize.width: sourceWidth
        sourceSize.height: sourceHeight
        sourceClipRect: Qt.rect(0, 0, sourceWidth, sourceHeight)
        visible: false

    }
    ShaderEffect {
        id: roundedImage
        property Image src: imageItem
        property real radius: Material.SmallScale
        // property real topLeftRadius: 0
        // property real topRightRadius: 0
        // property real bottomLeftRadius: 0
        // property real bottomRightRadius: 0
        property real softness: 0

        anchors.fill: parent
        vertexShader: "qrc:/UI/shaders/roundImage.vert"
        fragmentShader: "qrc:/UI/shaders/roundImage.frag"
    }
}
