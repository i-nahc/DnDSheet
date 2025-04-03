import QtQuick
import QtQuick.Controls.Material
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Effects

Item {
    id: topLevel

    property bool isMaximized: false
    anchors{
        right: parent.right
        top: parent.top
    }
    height: Screen.width/48
    width: Screen.width/48 // expanded: 160
    anchors.rightMargin: Screen.width/76.8
    anchors.topMargin: Screen.height/60

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

                closeArea.topLeftRadius = topLevel.width/2
                closeArea.bottomLeftRadius = topLevel.width/2
            }
        }
    }

    Rectangle{
        anchors.fill: parent
        color: Style.primaryColorDark
        radius: topLevel.width/2
    }

    RowLayout{
        anchors.fill: parent
        spacing: 0
        Rectangle{
            id: minimizeArea
            Layout.fillWidth: true
            Layout.fillHeight: true
            topLeftRadius: topLevel.width/2
            bottomLeftRadius: topLevel.width/2
            visible: false
            color: Style.primaryColorDark
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
            color: Style.primaryColorDark
            Image{
                source: "qrc:/UI/assets/coreUI/icon_maximize.svg"
                anchors.centerIn: parent
                z: 2
            }
            Image{
                source: "qrc:/UI/assets/coreUI/icon_maximize.svg"
                anchors.centerIn: parent
                anchors.horizontalCenterOffset: Screen.width/700
                anchors.verticalCenterOffset: -Screen.width/700
                z: 1
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
            topRightRadius: topLevel.width/2
            bottomRightRadius: topLevel.width/2
            topLeftRadius: topLevel.width/2
            bottomLeftRadius: topLevel.width/2
            color: Style.primaryColorDark
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
        to: Screen.width/12; duration: 200
    }
    NumberAnimation{
        id: shrinkArea
        target: topLevel
        properties: "width"
        to: Screen.width/48; duration: 200
    }
}
