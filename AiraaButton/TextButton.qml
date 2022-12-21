import QtQuick 2.15

/*!
   \qmltype Text Button

   \inqmlmodule QtQuick

   \brief Button with Text.

   \inherits ButtonBase

        Inheriting ButtonBase Component and adding Text Object.
*/

ButtonBase{

    /*! \qmlproperty string buttonText
        Property declaration set to display the text for the button. */
    property string buttonText: ""

    // Adding a Text Child Object for the button.
    Text {
        id:buttonTxt
        text:buttonText
        anchors.centerIn: parent
    }
}
