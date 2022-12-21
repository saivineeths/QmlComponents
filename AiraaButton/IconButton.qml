import QtQuick 2.15

/*!
   \qmltype Icon Button

   \inqmlmodule QtQuick

   \brief Button with Image.

   \inherits ButtonBase

        Inheriting ButtonBase Component and adding Image Object.
*/

ButtonBase{

    /*! \qmlproperty string iconPath
        Property declaration to set the source path of the image for the button. */
    property string iconPath: " "

    // Adding an Image Child Object for the button.
    Image {
        anchors.centerIn:parent
        source: iconPath
        height:50
        width:100
    }
}
