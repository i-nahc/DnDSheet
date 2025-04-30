import QtQuick


Item {
    id: wheelOptionController
    // icon name would be relative path from UI/assets folder
    property string iconName: "/logo/dndWhite.svg"
    property string toolTip: "placeholder tool tip"
    property int iconDimensions: 50

    height: iconDimensions
    width: iconDimensions

    Rectangle{
        id: circleBackground
        anchors.centerIn: parent
        radius: parent.width/2
        width: parent.width
        height: parent.height
        color: Style.primaryColorDark
    }
    Image{
        id: iconImage
        anchors.centerIn: parent
        height: parent.height * 0.6
        width: parent.width * 0.6
        source: "qrc:/UI/assets" + iconName
    }
}
