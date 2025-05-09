import QtQuick
import QtQuick.Layouts

Item {
    id: mainItem
    anchors.fill: parent

    Item {
        id: sideBar
        width: Screen.height / 20
        height: parent.height * 0.8
        anchors.verticalCenter: parent.verticalCenter
        x: Screen.height / 20
        GuideSideBar{
            anchors.fill: parent
        }
    }
    Item{
        anchors.left: sideBar.right
        anchors.verticalCenter: parent.verticalCenter
        anchors.leftMargin: parent.width * 0.05
        height: parent.height * 0.8
        width: parent.width * 0.75
        GuideInfo{

        }
    }
}
