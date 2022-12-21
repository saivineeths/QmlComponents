import QtQuick 2.15

ButtonBase{
    property string name: "text"


    Text {
        id:buttonText
        text:name
        anchors.centerIn: parent
    }

}

