import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Controls.Material

Item {
    id: viewport
    property bool changelogVisible: false
    property bool changeTextVisible: false
    anchors.fill: parent

    // ChangeLog
    Item{
        id: changelogParent
        anchors.top: parent.top
        width: parent.width * 0.3
        height: parent.height * 0.05

        transform: Translate{
            id: translateChangelog
            y: changelogVisible ? viewport.height * 0.1 + viewport.height*0.7 : 0
            x: parent.width * 0.05
        }

        Rectangle{
            // the actual changelog part
            id: changelogContainer
            anchors.bottom: changelogLabelBkg.top
            height: changelogVisible ? viewport.height * 0.7 - viewport.height*0.05 : 0
            width: viewport.width * 0.3
            topLeftRadius: Material.SmallScale
            topRightRadius: Material.SmallScale

            color: Style.primaryColorDark
            ChangelogList{
                visible: changeTextVisible
            }
        }

        Rectangle{
            id: changelogLabelBkg
            anchors.fill: parent
            color: Style.primaryColorDark
            bottomLeftRadius: Material.SmallScale
            bottomRightRadius: Material.SmallScale
        }
        ColumnLayout{
            id: changelogLabel
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
                MouseArea{
                    id: changelogDropdownClick
                    anchors.fill: parent
                    acceptedButtons: Qt.LeftButton
                    onPressed: changelogDropdown.color = Style.primaryColorDarkClick
                    onReleased: changelogDropdown.color = Style.primaryColorDarkHover
                    onClicked: {
                        // do animation to bring up the changelog
                        if(!changelogVisible)
                        {
                            activateChangelogAnim.running = true
                            //changelogVisible = true
                        }
                        else
                        {
                            deactivateChangelogAnim.running = true
                            //changelogVisible = false
                        }

                    }
                }
            }
        }

        ParallelAnimation{
            id: activateChangelogAnim
            NumberAnimation{
                property: "y"
                target: translateChangelog
                to: viewport.height * 0.1 + viewport.height*0.7; duration: 200
            }
            NumberAnimation{
                property: "height"
                target: changelogContainer
                to: viewport.height * 0.7 - viewport.height*0.05; duration: 200
            }
            NumberAnimation{
                target: changelogSpacer
                property: "Layout.maximumWidth"
                to: viewport.width * 0.3; duration: 200
            }
            NumberAnimation{
                target: changelogSpacer
                property: "Layout.leftMargin"
                to: viewport.width * 0.05; duration: 200
            }
            NumberAnimation{
                target: grid
                properties: "Layout.rightMargin, Layout.leftMargin"
                to: parent.width*0.1; duration: 0
            }
            PropertyAnimation{
                target: viewport
                property: "changelogVisible"
                to: true; duration: 200
            }
            PropertyAnimation{
                target: viewport
                property: "changeTextVisible"
                to: true; duration: 0
            }

        }
        ParallelAnimation{
            id: deactivateChangelogAnim
            NumberAnimation{
                property: "y"
                target: translateChangelog
                to: 0; duration: 200
            }
            NumberAnimation{
                property: "height"
                target: changelogContainer
                to: 0; duration: 200
            }
            NumberAnimation{
                target: changelogSpacer
                property: "Layout.maximumWidth"
                to: 0; duration: 200
            }
            NumberAnimation{
                target: changelogSpacer
                property: "Layout.leftMargin"
                to: 0; duration: 200
            }
            NumberAnimation{
                target: grid
                properties: "Layout.rightMargin, Layout.leftMargin"
                to: 0; duration: 200
            }

            PropertyAnimation{
                target: viewport
                property: "changelogVisible"
                to: false; duration: 200
            }
            PropertyAnimation{
                target: viewport
                property: "changeTextVisible"
                to: false; duration: 0
            }
        }
    }

    RowLayout{
        anchors.fill: parent
        spacing: parent.width * 0.05

        // This is a placeholder we will expand when the changelog is clicked in order to shift the menu
        Rectangle{
            id: changelogSpacer
            Layout.fillWidth: true
            Layout.fillHeight: true

            // Set margin + width to 0 while changelog inactive
            Layout.maximumWidth: changelogVisible ? parent.width * 0.3 : 0
            Layout.maximumHeight: parent.height * 0.7
            Layout.leftMargin: changelogVisible ? parent.width * 0.05 : 0

            //radius: Material.SmallScale

            color: "transparent" // Style.primaryColorDark
        }

        // the grid of menu options
        GridLayout{

            id: grid
            flow: GridLayout.TopToBottom
            columns: 4

            Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter

            Layout.maximumWidth: parent.width * 0.6
            Layout.maximumHeight: parent.height * 0.7

            Layout.rightMargin: changelogVisible ? parent.width * 0.05 : 0
            Layout.leftMargin: changelogVisible ? parent.width * 0.05 : 0
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
