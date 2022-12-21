import QtQuick 2.15

ButtonBase{
   property string iconPath: " "

    Image {
        id:image2
        anchors.centerIn:parent
        source: iconPath
    }

}

