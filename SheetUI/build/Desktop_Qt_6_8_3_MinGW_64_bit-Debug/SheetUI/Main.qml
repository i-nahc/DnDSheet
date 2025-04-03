import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Controls.Material

import "UI/resNavBar"

ApplicationWindow {
    id: primaryWindow
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
                primaryWindow.width = primaryWindow.maximumWidth
                primaryWindow.height = primaryWindow.maximumHeight
                primaryWindow.x = Screen.width / 2 - primaryWindow.width / 2
                primaryWindow.y = Screen.height / 2 - primaryWindow.height / 2
                mainNavBar.isMaximized = true
            }
            else
            {
                primaryWindow.width = primaryWindow.minimumWidth
                primaryWindow.height = primaryWindow.minimumHeight
                primaryWindow.x = Screen.width / 2 - primaryWindow.width / 2
                primaryWindow.y = Screen.height / 2 - primaryWindow.height / 2
                mainNavBar.isMaximized = false
            }

        }
        function onMinimizeTriggered() {
            primaryWindow.showMinimized()
        }
    }

    Rectangle{
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
                        return !containsMouse ? Qt.ArrowCursor:
                               edges == 3 || edges == 12 ? Qt.SizeFDiagCursor :
                               edges == 5 || edges == 10 ? Qt.SizeBDiagCursor :
                               edges & 9 ? Qt.SizeVerCursor :
                               edges & 6 ? Qt.SizeHorCursor : Qt.ArrowCursor;
                    }

            onPositionChanged: setEdges(mouseX, mouseY);
            onPressed: {
                setEdges(mouseX, mouseY);
                if(edges && containsMouse) {
                    startSystemResize(edges);
                    mainNavBar.isMaximized = false
                }
            }

            DragHandler{
                onActiveChanged: if (active) startSystemMove();
            }
        }
        id: viewport

        anchors.fill: parent
        radius: Material.MediumScale
        color: Style.primaryColor
        //color: "#2d313c"

        NavBar
        {
            id: mainNavBar
            // Put this drag handler here to supersede the main window
            DragHandler{
            }

        }

        WheelMenu
        {

        }
    }
}
