pragma Singleton

import QtQuick 2.15

Item {
    readonly property color primaryColor: "#2d313c"
    readonly property color primaryColorDark: "#1c1e23"
    readonly property color primaryColorDarkHover: "#414652"
    readonly property color secondaryColor: "#668cf0"// "#7257de"
    readonly property alias primaryFont: fontStyle

    FontLoader{
        id: fontStyle
        source: "qrc:/UI/settings/Montserrat-VariableFont_wght.ttf"
    }
}
