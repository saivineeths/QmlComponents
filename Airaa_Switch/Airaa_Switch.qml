/*!
\qml type Airaa Switch Button
\inqmlmodule QtQuick
\brife A Custom Switch AnimationController Creating a customized switch with diffrent for the diffrent state like onClicked ,checked state,ontoogled....s
qml inherited by
*/
import QtQuick 2.0

Rectangle {
    id: switch_board

    // public
    /*!
      \qmlproperty checked bool
            This property will hold the status of the switch
            The button will be on or off with this checked property
*/
    property bool checked: false
    /*!
      \qmlproperty switch_height number
            This property will hold the value of the height of the switch
            The integer that will give the height of the switch
*/
    property int switch_height: 20
    /*!
      \qmlproperty switch_width number
            This property will hold the value of the width of the switch
            The integer that will give the width of the switch
*/
    property int switch_width: 40
    /*!
      \qmlproperty checked_color string
            This property will hold the string of the color of the switch in checked state
            The button will be an integer that will give the width of the switch
*/
    property  string checked_color: "blue"
    /*!
      \qmlproperty checked_color string
            This property will hold the string of the color of the switch in unchecked state
            The string that will give the color of the switch when the it is checked
*/
    property string unchecked_color: "light blue"
    /*! \qmlproperty bool control_enable
               This property holds the enable property of the button and initialising with true. */
    property bool control_enable: true
    /*! \qmlsignal signal clicked()
               Creating clicked() Signal to integrate with MouseArea onClicked() property.
               This signal is emitted when the button is interactively clicked by the user via touch, mouse or keyboard. */

    signal clicked(bool checked);
    /*! \qmlsignal signal toggle()
               Creating toggle() Signal to integrate with switch onToggled() property.
               This signal is emitted when the switch is toggled form it initial position. */
    signal toggle();// onClicked:{root.checked = checked;  print('onClicked', checked)}

    // private
    width: switch_width;  height: switch_height // default size
    border.width: 0.05 * switch_board.height
    radius:       0.5  * switch_board.height
    color:  control_enable? checked? checked_color: unchecked_color :"grey"// background
    opacity:      enabled  &&  !mouseArea.pressed? 1: 0.3 // disabled/pressed state



    Rectangle { // pill
        id: pill
        color: control_enable?checked? unchecked_color: checked_color:"grey"
        anchors.verticalCenter: parent.verticalCenter
        x: checked? switch_board.width - pill.width: 0 // binding must not be broken with imperative x = ...
        width: switch_board.height;  height: width // square
        border.width: parent.border.width
        radius: parent.radius
    }
// MouseArea to perform the actions on the button
    MouseArea {
        id: mouseArea
        enabled: control_enable
        anchors.fill: parent

//drag will perform the toggling function
        drag {
            target:   pill
            axis:     Drag.XAxis
            maximumX: switch_board.width - pill.width
            minimumX: 0
        }

        onReleased: { // releasing at the end of drag
            if( checked  &&  pill.x < switch_board.width - pill.width)  switch_board.clicked(false) // right to left
            if(!checked  &&  pill.x)                            switch_board.clicked(true ) // left  to right
        }

        onClicked:{
            //switch_board.toggle()
            switch_board.clicked(!checked) // emit
            checked=!checked
            toggle()

        }
    }
}
