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

                closeArea.topLeftRadius = 0
                closeArea.bottomLeftRadius = 0

            }
            else{
                shrinkArea.running = true
                minimizeArea.visible = false
                maximizeArea.visible = false

                closeArea.topLeftRadius = Material.LargeScale
                closeArea.bottomLeftRadius = Material.LargeScale
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
            color: "#1c1e23"
            Image{
                source: "qrc:/UI/assets/coreUI/icon_minimize.svg"
                anchors.centerIn: parent
            }
            HoverHandler{
                onHoveredChanged:{
                    if(hovered){
                        // minimizeArea.color= "#668cf0" <- click color
                        parent.color = "#414652"
                    }
                    else{
                        parent.color= "#1c1e23"
                    }
                }
            }
            MouseArea{
                id: minimizeButton
                anchors.fill: parent
                acceptedButtons: Qt.LeftButton
                onPressed: parent.color = "#525866"
                onClicked: windowManager.triggerMinimize()
            }
        }
        Rectangle{
            id: maximizeArea
            Layout.fillWidth: true
            Layout.fillHeight: true
            visible: false
            color: "#1c1e23"
            Image{
                source: "qrc:/UI/assets/coreUI/icon_maximize.svg"
                anchors.centerIn: parent
            }
            HoverHandler{
                onHoveredChanged:{
                    if(hovered){
                        parent.color = "#414652"
                    }
                    else{
                        parent.color= "#1c1e23"
                    }
                }
            }
            MouseArea{
                id: maximizeButton
                anchors.fill: parent
                acceptedButtons: Qt.LeftButton
                onPressed: parent.color = "#525866"
                onClicked: windowManager.triggerMaximize()
            }
        }
        Rectangle{
            id: closeArea
            Layout.fillWidth: true
            Layout.fillHeight: true
            topRightRadius: Material.LargeScale
            bottomRightRadius: Material.LargeScale
            topLeftRadius: Material.LargeScale
            bottomLeftRadius: Material.LargeScale
            color: "#1c1e23"
            Image{
                source: "qrc:/UI/assets/coreUI/icon_close.svg"
                anchors.centerIn: parent
            }
            HoverHandler{
                onHoveredChanged:{
                    if(hovered){
                        // minimizeArea.color= "#668cf0" <- click color
                        parent.color = "#ba5f5f"
                    }
                    else{
                        parent.color= "#1c1e23"
                    }
                }
            }
            MouseArea{
                id: closeButton
                anchors.fill: parent
                acceptedButtons: Qt.LeftButton
                onPressed: parent.color = "#d94848"
                onClicked:
                {
                    windowManager.triggerExit()
                }

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
