import QtQuick 2.15

ButtonBase{
    property string name: "text"
    property string image1: ""
    Column{
        spacing:5
        anchors.centerIn: parent
    Image {
        id:image2
        source: image1


    }
    Text {
        id:buttonText1
        text:name

    }
    }
}
