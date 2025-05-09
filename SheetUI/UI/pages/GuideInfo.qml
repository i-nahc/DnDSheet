import QtQuick
import QtQuick.Controls.Material

Item {
    anchors.fill: parent
    Rectangle {
        anchors.fill: parent
        color: Style.primaryColorDark
        radius: Material.SmallScale
    }
    Text{
        anchors.centerIn: parent
        text: "Coming Soon"
        font.family: Style.primaryFont.name
        font.pixelSize: 20
        color: "white"
    }
}
