import QtQuick 2.15
import QtQuick.Layouts
Item {
    anchors.horizontalCenter: parent.horizontalCenter
    anchors.verticalCenter: parent.verticalCenter

    width: primaryWindow.width/1.5
    height: primaryWindow.height/1.5
    GridLayout{
        id: grid
        flow: GridLayout.TopToBottom
        columns: 4
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter

        width: parent.width
        height: parent.height
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

                sourceWidth: 736
                sourceHeight: 1104

                cropXOffset: 100
                cropYOffset: -100
            }
        }

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
                imageSrc: "/party.jpeg"

                cropXOffset: 100
                cropYOffset: -100
            }
        }

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

                cropXOffset: 100
                cropYOffset: -100
            }
        }

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

                sourceWidth: 1000
                sourceHeight: 1282

                cropYOffset: 150
            }
        }


    }
}
