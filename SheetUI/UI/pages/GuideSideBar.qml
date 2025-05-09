import QtQuick
import QtQuick.Layouts
import QtQuick.Controls.Material

Item {
    id: sideBarContainer
    anchors.fill: parent
    Rectangle {
        anchors.fill: parent
        color: Style.primaryColorDark
        radius: Material.SmallScale
    }

    ColumnLayout{
        anchors.centerIn: parent
        height: parent.height
        width: parent.width
        Item{
            Layout.alignment: Qt.AlignHCenter
            Layout.maximumWidth: parent.width
            Layout.maximumHeight: parent.width
            Layout.fillHeight: true
            Layout.preferredWidth: height
            GuideSideOption{
                id: artificerSelector
                imageSrc: "artificer.svg"
            }
        }
        Item{
            Layout.alignment: Qt.AlignHCenter
            Layout.maximumWidth: parent.width
            Layout.maximumHeight: parent.width
            Layout.fillHeight: true
            Layout.preferredWidth: height
            GuideSideOption{
                id: barbarianSelector
                imageSrc: "barbarian.svg"
            }
        }
        Item{
            Layout.alignment: Qt.AlignHCenter
            Layout.maximumWidth: parent.width
            Layout.maximumHeight: parent.width
            Layout.fillHeight: true
            Layout.preferredWidth: height
            GuideSideOption{
                id: bardSelector
                imageSrc: "bard.svg"
            }
        }
        Item{
            Layout.alignment: Qt.AlignHCenter
            Layout.maximumWidth: parent.width
            Layout.maximumHeight: parent.width
            Layout.fillHeight: true
            Layout.preferredWidth: height
            GuideSideOption{
                id: clericSelector
                imageSrc: "cleric.svg"
            }
        }
        Item{
            Layout.alignment: Qt.AlignHCenter
            Layout.maximumWidth: parent.width
            Layout.maximumHeight: parent.width
            Layout.fillHeight: true
            Layout.preferredWidth: height
            GuideSideOption{
                id: druidSelector
                imageSrc: "druid.svg"
            }
        }
        Item{
            Layout.alignment: Qt.AlignHCenter
            Layout.maximumWidth: parent.width
            Layout.maximumHeight: parent.width
            Layout.fillHeight: true
            Layout.preferredWidth: height
            GuideSideOption{
                id: fighterSelector
                imageSrc: "fighter.svg"
            }
        }
        Item{
            Layout.alignment: Qt.AlignHCenter
            Layout.maximumWidth: parent.width
            Layout.maximumHeight: parent.width
            Layout.fillHeight: true
            Layout.preferredWidth: height
            GuideSideOption{
                id: monkSelector
                imageSrc: "monk.svg"
            }
        }
        Item{
            Layout.alignment: Qt.AlignHCenter
            Layout.maximumWidth: parent.width
            Layout.maximumHeight: parent.width
            Layout.fillHeight: true
            Layout.preferredWidth: height
            GuideSideOption{
                id: paladinSelector
                imageSrc: "paladin.svg"
            }
        }
        Item{
            Layout.alignment: Qt.AlignHCenter
            Layout.maximumWidth: parent.width
            Layout.maximumHeight: parent.width
            Layout.fillHeight: true
            Layout.preferredWidth: height
            GuideSideOption{
                id: rangerSelector
                imageSrc: "ranger.svg"
            }
        }
        Item{
            Layout.alignment: Qt.AlignHCenter
            Layout.maximumWidth: parent.width
            Layout.maximumHeight: parent.width
            Layout.fillHeight: true
            Layout.preferredWidth: height
            GuideSideOption{
                id: rogueSelector
                imageSrc: "rogue.svg"
            }
        }
        Item{
            Layout.alignment: Qt.AlignHCenter
            Layout.maximumWidth: parent.width
            Layout.maximumHeight: parent.width
            Layout.fillHeight: true
            Layout.preferredWidth: height
            GuideSideOption{
                id: sorcSelector
                imageSrc: "sorcerer.svg"
            }
        }
        Item{
            Layout.alignment: Qt.AlignHCenter
            Layout.maximumWidth: parent.width
            Layout.maximumHeight: parent.width
            Layout.fillHeight: true
            Layout.preferredWidth: height
            GuideSideOption{
                id: wizSelector
                imageSrc: "wizard.svg"
            }
        }
        Item{
            Layout.alignment: Qt.AlignHCenter
            Layout.maximumWidth: parent.width
            Layout.maximumHeight: parent.width
            Layout.fillHeight: true
            Layout.preferredWidth: height
            GuideSideOption{
                id: lockSelector
                imageSrc: "warlock.svg"
            }
        }


    }

}
