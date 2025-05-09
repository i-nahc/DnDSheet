import QtQuick

Item {
    property string imageSrc: "artificer.svg" // default
    property string popUp: ""
    anchors.centerIn: parent
    width: parent.width
    height: parent.height
    Image{
        anchors.centerIn: parent
        width: parent.width
        height: parent.height
        source: "qrc:/UI/assets/class/" + imageSrc
    }
}
