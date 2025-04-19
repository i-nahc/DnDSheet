import QtQuick 2.15
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
            Item{
                id: itemListParent
                Layout.fillWidth: true
                Layout.fillHeight: true
                Layout.preferredHeight: 14
                Rectangle{
                    color: Style.primaryColorDark
                    radius: Material.SmallScale
                    anchors.fill: parent
                }
                ListModel{
                    id: itemListModel
                }
                ListView{
                    anchors.fill: parent
                    clip: true
                    model: itemListModel
                    delegate: ItemsComponents{

                    }
                }
            }
        }
    }
}
