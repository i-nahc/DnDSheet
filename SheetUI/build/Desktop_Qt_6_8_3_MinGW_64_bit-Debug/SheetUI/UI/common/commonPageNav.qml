import QtQuick 2.15
import QtQuick.Layouts

Item {
    property string imageSrc: "/dice/d20white.svg"
    property string redirectTo: ""

    ColumnLayout{
        Item{
            Image{
                source: "qrc:/UI/assets"

            }
        }
        Rectangle
        {

        }
    }



    HoverHandler{
        onHoveredChanged:{
            if(hovered)
            {

            }
            else
            {

            }
        }
    }
    MouseArea{

    }

}
