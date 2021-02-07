import QtQuick 2.5
import QtQuick.Window 2.2
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.1
import QtQuick.Controls 1.4



Rectangle {
    id: recSwitch    
    width: 78
    height: 36
    radius: 20

    property bool onOff: false
    property var marg: recSwitch.width - circle.width

    function posCircle(onOff){
        circle.anchors.margins = onOff ? marg : 0;
    }

    color: onOff ? "#39F724" : "transparent"
    border.color: "black"
    border.width: 5
    anchors.top: recDigIn.top
    anchors.topMargin: 40
    anchors.horizontalCenter: recDigIn.horizontalCenter
    
    Rectangle {
        id: circle
        width: recSwitch.height
        height: recSwitch.height
        radius: 18
        color: "black"
        anchors.left: recSwitch.left
        property var pc: posCircle(onOff)
    }
    
    MouseArea {
        id: butSwitch
        anchors.fill: recSwitch
        onClicked: {
            onOff = !onOff
            sw.toggleSwitch();
        }
    }
}
