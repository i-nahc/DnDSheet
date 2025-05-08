import QtQuick

import QtQuick.Controls
import QtQuick.Controls.Material

ComboBox{
    property var modelSrc: ["placeholder"];
    property bool setHeight: false;
    property string lastValue: "null";
    property bool isTypeFilter: false;
    property bool isCatFilter: false;
    currentIndex: 0


    signal selectFiltersChanged(setTo: string)

    onActivated: {
        if(lastValue == "null")
        {
            selectFiltersChanged(control.currentText)
        }
        else if(lastValue !== control.currentText)
        {
            selectFiltersChanged(control.currentText)
        }
        lastValue = control.currentText
    }

    id: control
    height: parent.height - 20
    width: parent.width
    anchors.verticalCenter: parent.verticalCenter
    leftPadding: 10
    model: modelSrc

    delegate: ItemDelegate{
        id: selectorDelegate
        width: control.width
        height: 40
        padding: 0
        background: Rectangle{
            clip: true
            anchors.left: parent.left
            anchors.leftMargin: 0
            width: control.width
            height: parent.height
            color: selectorDelegate.hovered ? Style.primaryColorDarkHover : "#404142"
            radius: 0
            Behavior on color{
                ColorAnimation{
                    duration: 200
                }
            }
        }
        contentItem: Rectangle{
            width: parent.implicitWidth
            height: selectorDelegate.height + 5
            color: selectorDelegate.hovered ? Style.primaryColorDarkHover : "#404142"
            Behavior on color{
                ColorAnimation{
                    duration: 200
                }
            }
            Text{
            text: modelData
            color: "White"
            font.family: Style.primaryFont.name
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 16
            leftPadding: 10
            }
        }
        //highlighted: parent.highlightedIndex === index
    }

    contentItem: Text{
        text: parent.displayText
        font.family: Style.primaryFont.name
        font.pixelSize: 18
        verticalAlignment: Text.AlignVCenter
        color: "White"
        leftPadding: 12
    }

    background: Rectangle{
        color: control.hovered ? Style.primaryColorDarkHover : Style.primaryColorDark
        radius: Material.SmallScale
        Behavior on color{
            ColorAnimation{
                duration: 200
            }
        }
    }

    popup: Popup{
        y: parent.height - 1
        width: parent.width
        height: setHeight ? parent.height * 15 : contentItem.implicitHeight
        implicitHeight: contentItem.implicitHeight
        padding: 1
        topPadding: 5
        bottomPadding: 5
        contentItem: ListView{
            clip: true
            implicitHeight: contentHeight
            model: control.popup.visible ? control.delegateModel : null
            currentIndex: control.highlightedIndex
            displayMarginBeginning: parent.height * 0.1
            displayMarginEnd: parent.height * 0.1

            ScrollIndicator.vertical: ScrollIndicator{}
        }

        background: Rectangle{
            color: "#404142"
            radius: Material.SmallScale
        }
    }
}
