import QtQuick 2.15
import QtQuick.Controls 2.15
Rectangle {
    id: myRect
    width: 200; height: 100
    radius:5
    property bool enable_control: true
    property color normal:"yellow"
    property color disable:"grey"
    property color hovered:"pink"
    property color pressed:"dark blue"
    property color border1: "white"
    state: "normal"
    signal clicked();

    MouseArea
    {
        id: mouseArea
        anchors.fill: parent
        hoverEnabled: true
        enabled:enable_control
        onEntered: myRect.state="hovered"
        onPressed:myRect.state="pressed"
        onReleased: myRect.state="normal"
        onExited:myRect.state="normal"
        onClicked:myRect.clicked()

    }
    states: [
        State {
            name: "normal"
            PropertyChanges {
                target: myRect;
                color:mouseArea.enabled?normal:disable }
        },

        State {
            name: "hovered"
            PropertyChanges {
                target: myRect;
                color: hovered }
        },

        State{
            name:"pressed"
            PropertyChanges {
                target: myRect;
                color:pressed
                border.color:border1
            }

            }

    ]
}





