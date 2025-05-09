import QtQuick
import QtQuick.Layouts

Item {
    id: mainItem
    anchors.fill: parent

    Item {
        width: Screen.height / 20
        height: parent.height * 0.8
        anchors.verticalCenter: parent.verticalCenter
        x: Screen.height / 20
        GuideSideBar{
            anchors.fill: parent
        }
    }
}
