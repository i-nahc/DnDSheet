import QtQuick 2.15
import QtQuick.Layouts

// Supported categories: Armor, weapons

Rectangle{
    id: itemEntry
    property int itemCategory: 0 // 0 = A 1 = W

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
    property int itemSubCat: 0
    anchors.fill: parent
    color: "transparent"
    RowLayout{
        // primary image/icon (category)
        Image{
            source: if(itemCategory == 0)
                    {"qrc:/UI/assets/entity/armor.svg"}
                    else
                    {"qrc:/UI/assets/entity/weapon.svg"}
        }

        // secondary image/icon (sub-category)
        Item{
            // wrap in item so we can make image invisible, but still have it take space in layout
            Image{
                source: "qrc:/UI/assets/weapon/" + append
                property string append: switch(itemSubCat){
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
                                        }
                visible: itemCategory == 1
            }
        }



        // Name
        Text{
            text: "Placeholder Name Longest"
        }

        // Rarity
        Text{
            text: "Rarity"
        }

        // AC/LMH Or Dies

        // tooltip
    }
}
