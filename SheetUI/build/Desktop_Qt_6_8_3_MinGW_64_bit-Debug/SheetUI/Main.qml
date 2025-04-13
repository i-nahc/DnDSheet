import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Controls.Material
import QtQuick.Layouts

import "UI/resNavBar"
import "UI/navigation"

ApplicationWindow {
    id: primaryWindow

    property string pageDirBase: "UI"
    property string pageDirAppend: ""
    property string curPage: "home"

    Material.theme: Material.Dark
    Material.accent: Material.Indigo
    minimumWidth: Screen.width/3.2
    minimumHeight: Screen.height/2.4
    maximumWidth: Screen.width
    maximumHeight: Screen.height

    width: Screen.width/3.2
    height: Screen.height/2.4
    visible: true
    title: qsTr("DNDSheet")
    color: "transparent"
    flags: Qt.FramelessWindowHint | Qt.Window
    Connections{
        target: windowManager
        function onMaximizeTriggered() {
            if(!mainNavBar.isMaximized)
            {
                mainNavBar.isMaximized = true
                primaryWindow.showMaximized()
            }
            else
            {
                primaryWindow.width = primaryWindow.minimumWidth
                primaryWindow.height = primaryWindow.minimumHeight
                primaryWindow.x = Screen.width / 2 - primaryWindow.width / 2
                primaryWindow.y = Screen.height / 2 - primaryWindow.height / 2
                mainNavBar.isMaximized = false
                primaryWindow.showNormal()
            }

        }
        function onMinimizeTriggered() {
            primaryWindow.showMinimized()
        }

        function onMenuTriggered(redirect){
            console.log("Going to " + redirect);
            if(redirect !== curPage)
            {
                if(redirect === "home")
                {
                    pageDirAppend = "/navigation/MenuPage.qml"
                }
                else if(redirect === "characters")
                {

                }
            }
            else
            {
                console.log("No Redirect: Same page...")
            }
        }
    }

    // Mouse functions
    MouseArea {
        id: mouseResize
        anchors.fill: parent
        hoverEnabled: true
        acceptedButtons: Qt.LeftButton

        property int edges: 0;
        property int edgeOffset: 5;

        function setEdges(x,y){
            edges = 0;
            if(x < edgeOffset) edges |= Qt.LeftEdge
            if(x > (width - edgeOffset))  edges |= Qt.RightEdge;
            if(y < edgeOffset) edges |= Qt.TopEdge;
            if(y > (height - edgeOffset)) edges |= Qt.BottomEdge;
        }

        cursorShape: {
            if(!mainNavBar.isMaximized)
            {
                return !containsMouse ? Qt.ArrowCursor:
                       edges == 3 || edges == 12 ? Qt.SizeFDiagCursor :
                       edges == 5 || edges == 10 ? Qt.SizeBDiagCursor :
                       edges & 9 ? Qt.SizeVerCursor :
                       edges & 6 ? Qt.SizeHorCursor : Qt.ArrowCursor;
            }
        }

        onPositionChanged: setEdges(mouseX, mouseY);
        onPressed: {
            setEdges(mouseX, mouseY);
            if(edges && containsMouse && !mainNavBar.isMaximized) {
                startSystemResize(edges);
                mainNavBar.isMaximized = false
            }
        }
    }

    Item{
        id: viewport

        anchors.fill: parent
        //color: "#2d313c"

        // Active on all pages
        LeftHandNav{
            id: leftNavBar
            topAnchor: mainNavBar.bottom
            isMaximized: mainNavBar.isMaximized
        }
        NavBar
        {
            id: mainNavBar
            Item{
                anchors.bottom: parent.bottom
                anchors.left: parent.left
                height: parent.height - 3

                // Subtract to account for close/maximize/minimize buttons
                width: parent.width - (Screen.width/10 + 3)
                transform: Translate{
                    x: 3
                }

                DragHandler{
                    onActiveChanged: if (active && !mainNavBar.isMaximized) startSystemMove();
                }
            }
        }

        // --- Pages ---
        Item{
            id: contentView
            anchors.left: leftNavBar.right
            anchors.top: mainNavBar.bottom
            anchors.topMargin: Screen.height/500
            anchors.right: viewport.right
            anchors.bottom: viewport.bottom
            Rectangle{
                anchors.fill: parent
                color: Style.primaryColor
                bottomRightRadius: mainNavBar.isMaximized ? 0 : Material.MediumScale
            }

            // Main Menu
            Loader{
                anchors.fill: parent
                id: pageLoader
                source: "UI/navigation/MenuPage.qml"
            }

            // Create Character

            // Party Builder/Display

            // Items

            // User Guide
        }
    }
}
