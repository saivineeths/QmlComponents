import QtQuick 2.15
import QtQuick.Controls 2.14

/*!
   \qmltype AiraaRadioButton

   \inqmlmodule QtQuick

   \brief A  RadioButton control.

        Creating a custom RadioButton Component wherein the colors of the Button
        can changed based on actions performed on the button. Properties are created
        to assign the color for the custom component.
*/


/*RadioButton presents an option button that can be toggled on (checked) or
off (unchecked). Radio buttons are typically used to select one option from a
set of options.*/

RadioButton {

    /*! \qmlproperty string buttonText
            This property holds the text for the RadioButton
            The button is tinted with the specified color unless the color is set to "blue" */

    property string buttonText: "Airaa RadioButton"

    /*! \qmlproperty color bcolor
            This property holds the color of outer boundary of the RadioButton and text when on pressed.
            The button is tinted with the specified color unless the color is set to "blue" */
    property color bcolor: "blue"
    /*! \qmlproperty color btocolor
            This property holds the color of outer boundary of the RadioButton and text when checked.
            The button is tinted with the specified color unless the color is set to "#21be2b" */
    property color btocolor: "#21be2b"
    /*! \qmlproperty color cUp
            This property holds the color of the RadioButton when unchecked.
            The button is tinted with the specified color unless the color is set to "white" */
    property color cUp: "white"
    /*! \qmlproperty cDown
            This property holds the color of the RadioButton when checked.
            The button is tinted with the specified color unless the color is set to "black" */
    property color cDown: "black"

    id: airaaRadio
    text: buttonText

    //This property holds the indicator item.
    indicator: Rectangle {
        implicitWidth: 26
        implicitHeight: 26
        x: airaaRadio.leftPadding
        y: parent.height / 2 - height / 2
        radius: 13
        border.color: airaaRadio.down ? bcolor : btocolor

        Rectangle {
            width: 14
            height: 14
            x: 6
            y: 6
            radius: 7
            color: airaaRadio.down ? cUp : cDown
            visible: airaaRadio.checked
        }
    }
    //This property holds the visual content item.
    contentItem: Text {
        text: airaaRadio.text
        font: airaaRadio.font
        opacity: enabled ? 1.0 : 0.3
        color: airaaRadio.down ? bcolor: btocolor
        verticalAlignment: Text.AlignVCenter
        leftPadding: airaaRadio.indicator.width + airaaRadio.spacing
    }
}



