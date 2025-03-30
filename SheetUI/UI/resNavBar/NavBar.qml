import QtQuick
import QtQuick.Controls.Material
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Effects

Item {
    id: topLevel

    anchors{
        right: parent.right
        top: parent.top
    }
    height: 30
    width: 30 // expanded: 120
    anchors.rightMargin: 25
    anchors.topMargin: 20

    HoverHandler{
        onHoveredChanged: {
            if(hovered){
                expandArea.running = true
                minimizeArea.visible = true
                maximizeArea.visible = true

            }
            else{
                shrinkArea.running = true
                minimizeArea.visible = false
                maximizeArea.visible = false
            }
        }
    }

    Rectangle{
        anchors.fill: parent
        color: "#1c1e23"
        radius: Material.LargeScale
    }

    RowLayout{
        anchors.fill: parent
        spacing: 0
        Rectangle{
            id: minimizeArea
            Layout.fillWidth: true
            Layout.fillHeight: true
            topLeftRadius: Material.LargeScale
            bottomLeftRadius: Material.LargeScale
            visible: false
            color: "red"
            Image{
                source: "qrc:/UI/assets/coreUI/icon_minimize.svg"
                anchors.centerIn: parent
            }
        }
        Rectangle{
            id: maximizeArea
            Layout.fillWidth: true
            Layout.fillHeight: true
            visible: false
            color: "green"
            Image{
                source: "qrc:/UI/assets/coreUI/icon_maximize.svg"
                anchors.centerIn: parent
            }
        }
        Rectangle{
            id: closeArea
            Layout.fillWidth: true
            Layout.fillHeight: true
            topRightRadius: Material.LargeScale
            bottomRightRadius: Material.LargeScale
            color: "blue"
            Image{
                source: "qrc:/UI/assets/coreUI/icon_close.svg"
                anchors.centerIn: parent
            }
        }
    }

    NumberAnimation{
        id: expandArea
        target: topLevel
        properties: "width"
        to: 120; duration: 200
    }
    NumberAnimation{
        id: shrinkArea
        target: topLevel
        properties: "width"
        to: 30; duration: 200
    }
}
