import QtQuick

Item {
    id: wheelArea
    property int dimension: Math.min(parent.width, parent.height)
    width: dimension * 0.8
    height: dimension * 0.8

    anchors.centerIn: parent

    Rectangle{
        anchors.centerIn: parent
        color: Style.secondaryColor
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
}
