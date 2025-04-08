import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Controls.Material

Item {
    property bool changelogVisible: true
    anchors.fill: parent

    Item{
        id: changelog

        width: parent.width * 0.35
        anchors.top: parent.top
        anchors.bottom: parent.bottom

        Rectangle{
            anchors.fill: parent
            color: "blue"
        }

        Rectangle{
            anchors.right: parent.right
            anchors.verticalCenter: parent.verticalCenter
        }

        Text{

        }
    }


    GridLayout{

        id: grid
        flow: GridLayout.TopToBottom
        columns: 4

        width: parent.width * 0.5
        height: parent.height * 0.7
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter

        transform: Translate{
            x: parent.width * 0.15
        }


        // -- GUIDE --
        Item{
            Layout.column: 0
            Layout.row: 0
            Layout.rowSpan: 2
            Layout.fillHeight: true
            Layout.fillWidth: true

            Layout.alignment: Qt.AlignLeft
            Layout.preferredWidth: 1
            Layout.preferredHeight: 2
            MenuOption{
                imageSrc: "/verticalLeft.jpg"
                associatedPage: "guide"

                sourceWidth: 736
                sourceHeight: 1104

                labelText: "GUIDE"
                labelHeight: parent.width/6.4

                xOffset: 0
                yOffset: 0
            }
        }

        // -- CREATE --
        Item{
            Layout.column: 1
            Layout.row: 0
            Layout.rowSpan: 1
            Layout.columnSpan: 2
            Layout.fillHeight: true
            Layout.fillWidth: true

            Layout.alignment: Qt.AlignTop
            Layout.preferredWidth: 2
            Layout.preferredHeight: 1
            MenuOption{
                imageSrc: "/armory.jpg"
                associatedPage: "characters"

                sourceWidth: 1000
                sourceHeight: 647

                labelHeight: parent.width/13
                labelText: "CHARACTERS"

                xOffset: 0
                yOffset: 0
            }
        }

        // -- PARTY BUILDER --
        Item{
            Layout.column: 1
            Layout.row: 1
            Layout.rowSpan: 1
            Layout.columnSpan: 2
            Layout.fillHeight: true
            Layout.fillWidth: true

            Layout.alignment: Qt.AlignBottom
            Layout.preferredWidth: 2
            Layout.preferredHeight: 1
            MenuOption{
                imageSrc: "/party.jpeg"
                associatedPage: "party"

                sourceWidth: 1920
                sourceHeight: 980

                labelHeight: parent.width/13
                labelText: "PARTY"

                xOffset: 0
                yOffset: 0
            }
        }

        // -- ITEMS --
        Item{
            Layout.column: 3
            Layout.row: 0
            Layout.rowSpan: 2
            Layout.fillHeight: true
            Layout.fillWidth: true

            Layout.alignment: Qt.AlignRight
            Layout.preferredWidth: 1
            Layout.preferredHeight: 2
            MenuOption{
                imageSrc: "/verticalRight.jpg"
                associatedPage: "items"

                sourceWidth: 1000
                sourceHeight: 1282

                labelText: "ITEMS"
                labelHeight: parent.width/6.4

                xOffset: 0
                yOffset: 0
            }
        }
    }
}
