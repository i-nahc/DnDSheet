import QtQuick
import QtQuick.Layouts
import QtQuick.Controls.Material

Item {
    anchors.fill: parent
    Item{

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter

        width: parent.width * 0.9
        height: parent.height * 0.9

        Rectangle{
            color: "transparent"
            anchors.fill: parent
            //border.width: 10
            //border.color: "orange"
        }

        ColumnLayout{
            anchors.fill: parent
            spacing: parent.height * 0.01
            Item{
                id: itemListControlsParent
                Layout.fillWidth: true
                Layout.fillHeight: true
                Layout.preferredHeight: 1
                Rectangle{
                    color: Style.primaryColorDark
                    radius: Material.SmallScale
                    anchors.fill: parent
                }
                RowLayout{

                }
            }
            ColumnLayout{
                Layout.fillWidth: true
                Layout.fillHeight: true
                Layout.preferredHeight: 14
                spacing: 0
                Item{
                    id: itemListColumnHeaders
                    Layout.fillWidth: true
                    Layout.fillHeight:true
                    Layout.preferredHeight: 1

                    // header background
                    Rectangle{
                        color: Style.primaryColorDark
                        anchors.fill:parent
                        topRightRadius: Material.SmallScale
                        topLeftRadius: Material.SmallScale
                    }
                    RowLayout{
                        anchors.fill: parent
                        spacing: 0
                        Item{
                            // name spacer
                            Layout.fillHeight: true
                            Layout.fillWidth: true
                            Layout.preferredWidth: 4
                            Text{
                                anchors.fill: parent
                                font.family: Style.primaryFont.name
                                text: "Name"
                                color: "white"
                                verticalAlignment: Text.AlignVCenter
                                leftPadding: 15
                                clip: true
                                fontSizeMode: Text.Fit
                                font.pixelSize: 18
                            }
                            Rectangle{
                                anchors.right: parent.right
                                width: 1
                                color: Style.primaryColorDarkHover
                                anchors.top: parent.top
                                anchors.bottom: parent.bottom
                                anchors.topMargin: parent.height*0.15
                                anchors.bottomMargin: parent.height*0.15
                            }
                        }
                        Item{
                            // Category spacer
                            Layout.fillHeight: true
                            Layout.fillWidth: true
                            Layout.preferredWidth: 3
                            Text{
                                anchors.fill: parent
                                font.family: Style.primaryFont.name
                                text: "Category"
                                color: "white"
                                verticalAlignment: Text.AlignVCenter
                                leftPadding: 15
                                clip: true
                                fontSizeMode: Text.Fit
                                font.pixelSize: 18
                            }
                            Rectangle{
                                anchors.right: parent.right
                                width: 1
                                color: Style.primaryColorDarkHover
                                anchors.top: parent.top
                                anchors.bottom: parent.bottom
                                anchors.topMargin: parent.height*0.15
                                anchors.bottomMargin: parent.height*0.15
                            }
                        }
                        Item{
                            // proficiency spacer
                            Layout.fillHeight: true
                            Layout.fillWidth: true
                            Layout.preferredWidth: 3
                            Text{
                                anchors.fill: parent
                                font.family: Style.primaryFont.name
                                text: "Proficiency"
                                color: "white"
                                verticalAlignment: Text.AlignVCenter
                                leftPadding: 15
                                clip: true
                                fontSizeMode: Text.Fit
                                font.pixelSize: 18
                            }
                            Rectangle{
                                anchors.right: parent.right
                                width: 1
                                color: Style.primaryColorDarkHover
                                anchors.top: parent.top
                                anchors.bottom: parent.bottom
                                anchors.topMargin: parent.height*0.15
                                anchors.bottomMargin: parent.height*0.15
                            }
                        }
                        Item{
                            // stats spacer
                            Layout.fillHeight: true
                            Layout.fillWidth: true
                            Layout.preferredWidth: 3
                            Text{
                                anchors.fill: parent
                                font.family: Style.primaryFont.name
                                text: "Stats"
                                color: "white"
                                verticalAlignment: Text.AlignVCenter
                                leftPadding: 15
                                clip: true
                                fontSizeMode: Text.Fit
                                font.pixelSize: 18
                            }
                            Rectangle{
                                anchors.right: parent.right
                                width: 1
                                color: Style.primaryColorDarkHover
                                anchors.top: parent.top
                                anchors.bottom: parent.bottom
                                anchors.topMargin: parent.height*0.15
                                anchors.bottomMargin: parent.height*0.15
                            }
                        }
                        Item{
                            // weight spacer
                            Layout.fillHeight: true
                            Layout.fillWidth: true
                            Layout.preferredWidth: 2
                            Text{
                                anchors.fill: parent
                                font.family: Style.primaryFont.name
                                text: "Weight"
                                color: "white"
                                verticalAlignment: Text.AlignVCenter
                                leftPadding: 15
                                clip: true
                                fontSizeMode: Text.Fit
                                font.pixelSize: 18
                            }
                            Rectangle{
                                anchors.right: parent.right
                                width: 1
                                color: Style.primaryColorDarkHover
                                anchors.top: parent.top
                                anchors.bottom: parent.bottom
                                anchors.topMargin: parent.height*0.15
                                anchors.bottomMargin: parent.height*0.15
                            }
                        }
                        Item{
                            // properties spacer
                            Layout.fillHeight: true
                            Layout.fillWidth: true
                            Layout.preferredWidth: 4

                            Text{
                                anchors.fill: parent
                                font.family: Style.primaryFont.name
                                text: "Properties"
                                color: "white"
                                verticalAlignment: Text.AlignVCenter
                                leftPadding: 15
                                clip: true
                                fontSizeMode: Text.Fit
                                font.pixelSize: 18
                            }
                        }
                    }
                }

                Item{
                    id: itemListParent
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    Layout.preferredHeight: 14

                    // background of item list view
                    Rectangle{
                        color: Style.primaryColorDark
                        bottomLeftRadius: Material.SmallScale
                        bottomRightRadius: Material.SmallScale
                        anchors.fill: parent
                    }
                    ListView{
                        id: itemsListView
                        anchors.fill: parent
                        clip: true
                        model: 20
                        spacing: 10
                        delegate: Rectangle{
                            height: 40
                            width: itemsListView.width

                        }
                    }
                }
            }
        }
    }
}
