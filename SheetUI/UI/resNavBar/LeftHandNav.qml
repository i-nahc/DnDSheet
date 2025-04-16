import QtQuick
import QtQuick.Layouts
import QtQuick.Controls.Material

Item {
    id: topLevel

    property bool isMaximized: false
    property bool isExpanded: false
    property int activatedMenu: 0
    property var topAnchor: 0

    anchors.left: parent.left
    anchors.bottom: parent.bottom
    anchors.top: topAnchor
    width: Screen.height/20
    height: parent.height

    Rectangle{
        id: sideBar
        width: parent.width
        height: parent.height

        color: Style.primaryColorDark
        bottomLeftRadius: isMaximized ? 0 : Material.MediumScale
    }
    ColumnLayout{
        width: topLevel.width
        spacing: 0
        LeftHandOptions{
            id: collapseButton
            imageSrc: "/coreUI/chevron.svg"
            overrideSize: true
            sizeOverride: (Screen.height/20) * 0.4
            collapseMode: true
        }
        LeftHandOptions{
            id: homeButton
            imageSrc: "/util/home.svg"
            associatedPage: "home"
            textDisplay: "Home"
            active: activatedMenu == 0
        }
        LeftHandOptions{
            id: characterButton
            imageSrc: "/game/character.svg"
            associatedPage: "characters"
            textDisplay: "Characters"
            active: activatedMenu == 1
        }
        LeftHandOptions{
            id: partyButton
            imageSrc: "/game/party.svg"
            associatedPage: "party"
            textDisplay: "Party"
            active: activatedMenu == 2
        }
        LeftHandOptions{
            id: itemsButton
            imageSrc: "/game/adventure-book.svg"
            associatedPage: "items"
            textDisplay: "Items"
            active: activatedMenu == 3
        }
        LeftHandOptions{
            id: guideButton
            imageSrc: "/entity/archive.svg"
            associatedPage: "guide"
            textDisplay: "Guide"
            active: activatedMenu == 4
        }
    }

    NumberAnimation{
        id: shrinkMenu
        target: topLevel
        running: !collapseButton.active
        properties: "width"
        from: Screen.height/3.5
        to: Screen.height/20; duration: 200

    }
    NumberAnimation{
        id: expandMenu
        target: topLevel
        running: collapseButton.active
        properties: "width"
        from: Screen.height/20
        to: Screen.height/3.5; duration: 200
    }
}
