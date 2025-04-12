import QtQuick

Item {
    id: topLevel
    property string imageSrc: ""
    property string associatedPage: ""
    property string textDisplay: ""
    property bool overrideSize: false
    property bool collapseMode: false
    property bool active: false
    property int sizeOverride: 0

    width: parent.width
    height: Screen.height/20

    Rectangle{
        id: iconArea
        color: Style.primaryColorDark
        width: parent.width
        height: Screen.height/20
        Item{
            id: imgSubsection
            width: Screen.height/20
            height: width
            anchors.left: parent.left
            Image{
                id: img
                anchors.centerIn: parent
                source: "qrc:/UI/assets" + imageSrc
                fillMode: Image.PreserveAspectFit
                width: overrideSize ? sizeOverride : parent.width * 0.6
                height: width
                mipmap: true
                antialiasing: true
            }
            Rectangle{
                id: leftBorder
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                color: Style.secondaryColor
                width: parent.width/20
                visible: collapseMode ? false : active
            }
        }
        Text{
            visible: !collapseMode
            anchors.left: imgSubsection.right
            anchors.leftMargin: imgSubsection.width/10
            anchors.verticalCenter: parent.verticalCenter
            text: textDisplay
            fontSizeMode: Text.Fit
            font.family: Style.primaryFont.name
            minimumPixelSize: 8
            font.pixelSize: 20
            color: "white"
        }
    }
    HoverHandler{
        onHoveredChanged: {
            if(hovered)
            {
                iconArea.color = Style.primaryColorDarkHover
            }
            else
            {
                iconArea.color = Style.primaryColorDark
            }
        }
    }
    MouseArea
    {
        id: clickArea
        anchors.fill: parent
        acceptedButtons: Qt.LeftButton
        onPressed: iconArea.color = Style.primaryColorDarkClick
        onReleased: iconArea.color = Style.primaryColorDarkHover
        onClicked: {
            // expand menu
            if(collapseMode)
            {
                if(active)
                {
                    unrotateAnim.running = true

                }
                else
                {
                    rotateAnim.running = true
                }
                active = !active
            }
        }
    }

    ParallelAnimation{
        id: unrotateAnim
        PropertyAnimation{
            target: imgSubsection
            properties: "anchors.leftMargin"
            to: 0; duration: 200
        }
        RotationAnimation{
            target: img
            direction: RotationAnimation.Counterclockwise
            to: 0; duration: 100
        }
    }
    ParallelAnimation{
        id: rotateAnim
        PropertyAnimation{
            target: imgSubsection
            properties: "anchors.leftMargin"
            to: Screen.height/3.5 - Screen.height/20; duration: 200
        }
        RotationAnimation{
            target: img
            direction: RotationAnimation.Clockwise
            to: 90; duration: 100
        }
    }
}
