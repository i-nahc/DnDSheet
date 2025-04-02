import QtQuick

Item {
    /*
      Menu Status vars
      */
    property bool menuIsOpen: false

    id: wheelArea
    property int dimension: Math.min(parent.width, parent.height)
    width: dimension * 0.8
    height: dimension * 0.8

    anchors.centerIn: parent

    Rectangle{
        anchors.centerIn: parent
        //color: Style.secondaryColor
        color: "transparent"
        width: parent.width
        height: parent.height
    }

    Item{
        id: centerArea
        anchors.centerIn: parent
        width: parent.width * 0.3
        height: parent.height * 0.3
        Rectangle{
            id: centerCircle
            anchors.centerIn: parent
            radius: parent.width/2
            width: parent.width
            height: parent.height
            color: Style.primaryColorDark
            HoverHandler{
                onHoveredChanged: {
                    if(hovered){
                        expandCenterCircle.running = true
                    }
                    else
                    {
                        shrinkCenterCircle.running = true
                    }
                }
            }

            MouseArea{
                anchors.fill: parent
                acceptedButtons: Qt.LeftButton
                onPressed: {
                    // some animation
                    expandCenterCircleMore.running = true
                }
                onReleased: {
                    expandCenterCircle.running = true
                }

                onClicked: {
                    // open other menus
                    menuIsOpen = true
                }
            }
        }
        Image{
            id: centerCircleDice
            anchors.centerIn: parent
            width: parent.width/1.75
            height: parent.height/1.75
            source: "qrc:/UI/assets/dice/d20white.svg"
        }

        Path {
            startX: 100; startY: 0
            PathArc{
                x: 0; y: 0
                radiusX: 100; radiusY: 100
            }
        }

    }

    NumberAnimation{
        id: expandCenterCircle
        targets: [centerCircle, centerCircleDice]
        properties: "scale"
        to: 1.1; duration: 100
    }
    NumberAnimation{
        id: shrinkCenterCircle
        targets: [centerCircle, centerCircleDice]
        properties: "scale"
        to: 1; duration: 100
    }
    NumberAnimation{
        id: expandCenterCircleMore
        targets: [centerCircle, centerCircleDice]
        properties: "scale"
        to: 1.15; duration: 80
    }

    WheelOption{
        id: settingsButton
        iconName: "/dice/d20white.svg"
        x: Window.width /2
        y: Window.height /2
    }
}
