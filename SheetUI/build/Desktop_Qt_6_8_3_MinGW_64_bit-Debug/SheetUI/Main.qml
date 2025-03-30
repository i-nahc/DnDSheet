import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Controls.Material

import "UI/resNavBar"

ApplicationWindow {
    Material.theme: Material.Dark
    Material.accent: Material.Indigo
    minimumWidth: 600
    minimumHeight: 500
    maximumWidth: 1200
    maximumHeight: 900
    width: 600
    height: 500
    visible: true
    title: qsTr("DNDSheet")
    color: "transparent"

    flags: Qt.FramelessWindowHint | Qt.Window

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
        }

        DragHandler{
            onActiveChanged: if (active) startSystemMove();
        }
        id: viewport

        anchors.fill: parent
        radius: Material.MediumScale
        color: "#2d313c"

        NavBar
        {
            id: topNavBar
        }
    }
}
