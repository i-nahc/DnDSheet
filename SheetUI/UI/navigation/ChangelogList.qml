import QtQuick

Item {
    id: mainArea
    anchors.left: parent.left
    anchors.top: parent.top
    anchors.bottom: parent.bottom

    width: parent.width * 0.95

    ListModel{
        id: changelogModel
        ListElement{change: "Test message, this happens to be pretty long and stuff"}
        ListElement{change: "Test message, this happens to be slightly shorter"}
        ListElement{change: "Test message, this happens to be pretty long and stuff"}
        ListElement{change: "Test message, this happens to be slightly shorter"}
        ListElement{change: "Test message, this happens to be pretty long and stuff"}
        ListElement{change: "Test message, this happens to be slightly shorter"}
        ListElement{change: "Test message, this happens to be pretty long and stuff"}
        ListElement{change: "Test message, this happens to be slightly shorter"}
        ListElement{change: "Test message, this happens to be pretty long and stuff"}
        ListElement{change: "Test message, this happens to be slightly shorter"}
        ListElement{change: "Test message, this happens to be pretty long and stuff"}
        ListElement{change: "Test message, this happens to be slightly shorter"}
        ListElement{change: "Test message, this happens to be pretty long and stuff"}
        ListElement{change: "Test message, this happens to be slightly shorter"}
        ListElement{change: "Test message, this happens to be pretty long and stuff"}
        ListElement{change: "Test message, this happens to be slightly shorter"}
    }

    Component{
        id: changeDelegate
        Text{
            width: mainArea.width
            color: "white"
            text: "<font color=\"#668cf0\">>  </font>" + model.change
            wrapMode: Text.Wrap
            font.family: Style.primaryFont.name
            font.pixelSize: mainArea.width*0.05
        }
    }

    ListView{
        anchors.fill:parent
        model: changelogModel
        delegate: changeDelegate
        spacing: parent.height * 0.025
        anchors.topMargin: parent.height * 0.075
        anchors.bottomMargin: parent.height * 0.1
        anchors.leftMargin: parent.width * 0.05
        anchors.rightMargin: parent.width * 0.05
        cacheBuffer: parent.height
    }
}
