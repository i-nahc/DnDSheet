import QtQuick 2.15
import QtQuick.Layouts

// Supported categories: Armor, weapons

// --- Subcategories ---
// --- Armor ---        --- WP ---
/*  0: Light            0: Battleaxe
    1: Medium           1: Bow
    2: Heavy            2: Club
                        3: Crossbow
                        4: Dagger
                        5: Flail
                        6: Glaive
                        7: Halberd
                        8: Hammer
                        9: Handaxe
                        10: Lance (unused)
                        11: Mace
                        12: Morningstar
                        13: Musket
                        14: Pike
                        15: Pistol
                        16: Rapier
                        17: Scimitar
                        18: Sickle
                        19: Sling
                        20: Spear
                        21: Staff
                        22: Strike (unused)
                        23: Sword
                        24: Trident
                        25: Whip
*/

/*property string append: switch(itemSubCat){
                        case 0: "battleaxe.svg"; break;
                        case 1: "bow.svg"; break;
                        case 2: "club.svg"; break;
                        case 3: "crossbow.svg"; break;
                        case 4: "dagger.svg"; break;
                        case 5: "flail.svg"; break;
                        case 6: "glaive.svg"; break;
                        case 7: "halberd.svg"; break;
                        case 8: "hammer.svg"; break;
                        case 9: "handaxe.svg"; break;
                        case 10: "lance.svg"; break;
                        case 11: "mace.svg"; break;
                        case 12: "morningstar.svg"; break;
                        case 13: "musket.svg"; break;
                        case 14: "pike.svg"; break;
                        case 15: "pistol.svg"; break;
                        case 16: "rapier.svg"; break;
                        case 17: "scimitar.svg"; break;
                        case 18: "sickle.svg"; break;
                        case 19: "sling.svg"; break;
                        case 20: "spear.svg"; break;
                        case 21: "staff.svg"; break;
                        case 22: "strike.svg"; break;
                        case 23: "sword.svg"; break;
                        case 24: "trident.svg"; break;
                        case 25: "whip.svg"; break;
                        default: "sword.svg"; break;
                        }*/
Rectangle{
    id: itemEntry

    property int itemCategory: 0 // 0 = A 1 = W
    property int itemSubCat: 0
    width: parent.width
    height: parent.height
    color: "transparent"
    Rectangle{
        id: hoverRectangle
        height: parent.height
        width: individualItemArea.containsMouse || propArea.containsMouse ? parent.width : 0
        gradient: Gradient{
            orientation: Gradient.Horizontal
            GradientStop{
                            position: 0
                            color: "transparent"
            }
            GradientStop{
                            position: 0.5
                            color: Style.primaryColorDarkHover
            }
            GradientStop{
                            position: 1
                            color: "transparent"
            }
        }
        Behavior on width{
            SmoothedAnimation{
                duration: 200
            }

        }
    }
    MouseArea{
        id: individualItemArea
        hoverEnabled: true
        anchors.fill: parent
    }
    RowLayout{
        spacing: 0
        anchors.fill: parent
        Item{
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.preferredWidth: 4
            RowLayout{
                anchors.fill: parent
                anchors.leftMargin: width * 0.05
                spacing: 0
                Image{
                    Layout.preferredHeight: itemEntry.height * 0.8
                    Layout.preferredWidth: height
                    verticalAlignment: Image.AlignVCenter
                    horizontalAlignment: Image.AlignHCenter
                    source: iconName
                }

                Text{
                    leftPadding: 15
                    Layout.fillWidth: true
                    font.family: Style.primaryFont.name
                    color: "white"
                    text: name
                    clip: true
                    verticalAlignment: Text.AlignVCenter
                    font.pixelSize: 15
                }
            }
        }
        Item{
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.preferredWidth: 3
            Text{
                leftPadding: 15
                anchors.fill: parent
                text: category
                font.family: Style.primaryFont.name
                color: "white"
                clip: true
                verticalAlignment: Text.AlignVCenter
                font.pixelSize: 15
            }
        }
        Item{
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.preferredWidth: 2
            Text{
                leftPadding: 15
                anchors.fill: parent
                text: cost
                font.family: Style.primaryFont.name
                color: "white"
                clip: true
                verticalAlignment: Text.AlignVCenter
                font.pixelSize: 15
            }
        }
        Item{
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.preferredWidth: 3
            Text{
                leftPadding: 15
                anchors.fill: parent
                text: stats
                font.family: Style.primaryFont.name
                color: "white"
                clip: true
                verticalAlignment: Text.AlignVCenter
                font.pixelSize: 15
            }
        }
        Item{
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.preferredWidth: 2
            Text{
                leftPadding: 15
                anchors.fill: parent
                text: weight
                font.family: Style.primaryFont.name
                color: "white"
                clip: true
                verticalAlignment: Text.AlignVCenter
                font.pixelSize: 15
            }
        }
        Item{
            property string propText: properties
            property string spacing: "          "
            property string combined: properties + spacing
            property string displayedProp: combined.substring(step) + combined.substring(0, step)
            property int step: 0
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.preferredWidth: 4
            Timer{
                interval: 100
                running: propArea.containsMouse && propTextChecker.width > (parent.width - 15)
                repeat: true
                onTriggered: propArea.containsMouse ? parent.step = (parent.step + 1) % parent.combined.length : 0
            }
            MouseArea{
                id: propArea
                hoverEnabled: true
                anchors.fill: parent
                onHoveredChanged: {
                    if(!containsMouse){
                        parent.step = 0
                    }
                }
            }
            Text{
                id: propertyTextHandler
                leftPadding: 15
                anchors.fill: parent
                text: parent.displayedProp
                font.family: Style.primaryFont.name
                color: "white"
                elide: Text.ElideNone
                verticalAlignment: Text.AlignVCenter
                font.pixelSize: 15
            }
            TextMetrics{
                id: propTextChecker
                font.family: Style.primaryFont.name
                font.pixelSize: 15
                text: properties

            }
        }
    }
}
