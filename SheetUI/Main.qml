import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Controls.Material

import "UI/resNavBar"

ApplicationWindow {
    id: primaryWindow
    Material.theme: Material.Dark
    Material.accent: Material.Indigo
    minimumWidth: 600
    minimumHeight: 500
    maximumWidth: 1200
    maximumHeight: 800
    width: 600
    height: 500
    visible: true
    title: qsTr("DNDSheet")
    color: "transparent"
    flags: Qt.FramelessWindowHint | Qt.Window
    Connections{
        target: windowManager
        function onMaximizeTriggered() {
            primaryWindow.width = primaryWindow.maximumWidth
            primaryWindow.height = primaryWindow.maximumHeight
            primaryWindow.x = Screen.width / 2 - primaryWindow.width / 2
            primaryWindow.y = Screen.height / 2 - primaryWindow.height / 2
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
                }
            }

            DragHandler{
                onActiveChanged: if (active) startSystemMove();
            }
        }
        id: viewport

        anchors.fill: parent
        radius: Material.MediumScale
        color: "#2d313c"

        NavBar
        {
            // Put this drag handler here to supersede the main window
            DragHandler{
            }
            id: topNavBar
        }
    }
}
