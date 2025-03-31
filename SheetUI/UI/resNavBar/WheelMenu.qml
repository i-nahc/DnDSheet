import QtQuick

Item {
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
        anchors.centerIn: parent
        width: parent.width * 0.3
        height: parent.height * 0.3
        Rectangle{
            anchors.centerIn: parent
            radius: parent.width/2
            width: parent.width
            height: parent.height
            color: Style.primaryColorDark
        }
        Image{
            anchors.centerIn: parent
            width: parent.width/1.75
            height: parent.height/1.75
            source: "qrc:/UI/assets/dice/d20white.svg"
        }

    }

    NumberAnimation{
        id: expand
    }
}
