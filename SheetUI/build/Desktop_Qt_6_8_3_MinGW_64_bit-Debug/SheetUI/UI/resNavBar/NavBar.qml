import QtQuick
import QtQuick.Controls.Material
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Effects

Item {
    id: topLevel

    property bool isMaximized: false
    property string windowMessage: "DNDSheet: TTRPG Companion"

    anchors.top: parent.top
    anchors.left: parent.left
    anchors.right: parent.right
    width: parent.width
    height: Screen.height/28

    Rectangle{
        id: header
        anchors.top: parent.top
        color: Style.primaryColorDark
        width: parent.width
        height: parent.height
        topLeftRadius: isMaximized ? 0 : Material.MediumScale
        topRightRadius: isMaximized ? 0 : Material.MediumScale

        Image{
            id: headerIcon
            source: "qrc:/UI/assets/dice/d20white.svg"
            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter

            transform: Translate{
                x: 10
            }

            height: parent.height * 0.8
            width: height
        }

        Text{
            id: headerText
            anchors.left: headerIcon.right
            font.family: Style.primaryFont.name
            color: "white"
            anchors.verticalCenter: parent.verticalCenter
            transform: Translate{
                x: headerIcon.width /1.5
            }

            fontSizeMode: Text.Fit
            text: windowMessage
        }
    }
    Rectangle{
        id: headerOutline
        anchors.top: header.bottom
        anchors.right: parent.right
        height: Screen.height/500
        width: parent.width
        color: Style.secondaryColor
    }

    RowLayout{
        anchors.right: parent.right
        anchors.top: parent.top

        width: Screen.width/10
        height: header.height
        spacing: 0
        Rectangle{
            id: minimizeArea
            Layout.fillWidth: true
            Layout.fillHeight: true
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
            color: Style.primaryColorDark
            Image{
                source: "qrc:/UI/assets/coreUI/icon_maximize.svg"
                anchors.centerIn: parent
                z: 2
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
            topRightRadius: isMaximized ? 0 : Material.MediumScale
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
}
