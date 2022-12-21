import QtQuick 2.15

/*!
   \qmltype Icon Text Button

   \inqmlmodule QtQuick

   \brief Button with Image and Text.

   \inherits ButtonBase

        Inheriting ButtonBase Component. Adding both Image and Text Object.
*/

ButtonBase{

    /*! \qmlproperty string buttonText
        Property declaration set to display the text for the button. */
    property string buttonText: ""

    /*! \qmlproperty string iconPath
        Property declaration to set the source path of the image for the button. */
    property string iconPath: ""

    // Adding an Image Child Object for the button.
    Image {
        id: buttom_image
        source:iconPath
        height: parent.height
        width:parent.width
        anchors.top:parent.top
    }

    // Adding a Text Child Object for the button.
    Text {
        id: button_text
        text: buttonText
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
    }
}
