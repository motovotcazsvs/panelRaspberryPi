import QtQuick 2.5
import QtQuick.Window 2.2
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.1
import QtQuick.Controls 1.4

Rectangle {
    id: recBack
    x: 20
    y: 20
    width: butBack.pressed ? 200 : 100
    height: butBack.pressed ? 200 : 100
    radius: butBack.pressed ? 100 : 50
    
    Image {
        id: imBack
        anchors.fill: recBack
        source: "images/back.png"
    }
    
    MouseArea {
        id: butBack
        anchors.fill: recBack
        onClicked: {
            stackView.pop(screenMain);
        }
    }
    
}
