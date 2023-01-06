import QtQuick 2.12
import QtQuick.Controls 2.12
/*!
   \qmltype AiraaCheckBox

   \inqmlmodule QtQuick

   \brief A  CheckBox control.

        Creating a custom CheckBox Component wherein the colors of the CheckBox
        can changed based on actions performed on the button. Properties are created
        to assign the color for the custom component.
*/
/*CheckBox presents an option button that can be toggled on (checked) or off
(unchecked). Check boxes are typically used to select one or more options from
a set of options. For larger sets of options, such as those in a list, consider
 using CheckDelegate instead.*/

CheckBox {
    id: control
    text: qsTr("CheckBox")
    checked: true
    /*! \qmlproperty color bcolor
            This property holds the color of outer boundary of the CheckBox and text when on pressed.
            The button is tinted with the specified color unless the color is set to "blue" */
    property color bcolor: "#17a81a"
    /*! \qmlproperty color btocolor
            This property holds the color of outer boundary of the CheckBox and text when checked.
            The button is tinted with the specified color unless the color is set to "#21be2b" */
    property color btocolor: "#17a81a"
    /*! \qmlproperty color cUp
            This property holds the color of the check mark when unchecked.
            The button is tinted with the specified color unless the color is set to "white" */
    property color cUp: "white"
    /*! \qmlproperty cDown
            This property holds the color of the check mark when checked.
            The button is tinted with the specified color unless the color is set to "black" */
    property color cDown: "black"


//This property holds the indicator item.
    indicator: Rectangle {
        implicitWidth: 26
        implicitHeight: 26
        x: control.leftPadding
        y: parent.height / 2 - height / 2
        radius: 3
        border.color: control.down ? "#17a81a" : "#21be2b"

        Rectangle {
            width: 14
            height: 14
            x: 6
            y: 6
            radius: 7
            color: control.down ? "#17a81a" : "#21be2b"
            visible: control.checked
        }
    }
 //This property holds the visual content item.
    contentItem: Text {
        text: control.text
        font: control.font
        opacity: enabled ? 1.0 : 0.3
        color: control.down ? "#17a81a" : "#21be2b"
        verticalAlignment: Text.AlignVCenter
        leftPadding: control.indicator.width + control.spacing
    }
}
