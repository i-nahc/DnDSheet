import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Controls.Material

Item {
    property bool changelogVisible: true
    anchors.fill: parent

    // ChangeLog
    Item{
        anchors.top: parent.top
        width: parent.width * 0.3
        height: parent.height * 0.05

        transform: Translate{
            x: parent.width * 0.05
        }

        Rectangle{
            anchors.fill: parent
            color: Style.primaryColorDark
            bottomLeftRadius: Material.SmallScale
            bottomRightRadius: Material.SmallScale
        }
        ColumnLayout{
            anchors.fill: parent
            width: parent.width
            height: parent.height
            spacing: 0
            Rectangle{
                Layout.fillWidth: true
                Layout.fillHeight: true
                color: "transparent"
                Layout.preferredHeight: 6
                Text{
                    anchors.fill: parent
                    color: "white"
                    font.family: Style.primaryFont.name
                    text: "CHANGELOG"
                    fontSizeMode: Text.Fit
                    minimumPixelSize: 8
                    font.pixelSize: 50
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
            }
            Rectangle{
                id: changelogDropdown
                Layout.fillHeight: true
                Layout.fillWidth: true
                Layout.preferredHeight: 4
                color: "transparent"
                bottomLeftRadius: Material.SmallScale
                bottomRightRadius: Material.SmallScale
                Image{
                    source: "qrc:/UI/assets/coreUI/downArrow.svg"
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    fillMode: Image.PreserveAspectFit
                    height: parent.height
                    width: parent.width * 0.2
                    mipmap: true
                }
                HoverHandler{
                    onHoveredChanged: {
                        if(hovered)
                        {
                            changelogDropdown.color = Style.primaryColorDarkHover
                        }
                        else
                        {
                            changelogDropdown.color = "transparent"
                        }
                    }
                }
            }

        }



    }

    RowLayout{
        anchors.fill: parent

        GridLayout{

            id: grid
            flow: GridLayout.TopToBottom
            columns: 4

            Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter

            Layout.maximumWidth: parent.width * 0.6
            Layout.maximumHeight: parent.height * 0.7


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
}
