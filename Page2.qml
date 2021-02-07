import QtQuick 2.5
import QtQuick.Window 2.2
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.1
import QtQuick.Controls 1.4

Page {
    id: page2
    visible: false
    
    Image {
        id: imageP2
        anchors.fill: parent
        opacity: 0.5
        source: "images/bgd2.jpg"
    }
    
    Text {
        id: buttonOff
        x: 512
        y: 200
        font.family: "Showcard Gothic"
        font.pointSize: butOff.pressed ? 34 : 24
        font.bold: true
        text: "OFF"
        
        MouseArea {
            id: butOff
            anchors.fill: buttonOff
            onClicked: {
                context.funcShotdown();
            }
        }
    }
    
    Text {
        id: buttonReset
        x: 512
        y: 300
        font.family: "Showcard Gothic"
        font.pointSize: butReset.pressed ? 34 : 24
        font.bold: true
        text: "RESET"
        
        MouseArea {
            id: butReset
            anchors.fill: buttonReset
            onClicked: {
                context.funcReboot();
            }
        }
    }
    
    Text {
        id: buttonExit
        x: 512
        y: 400
        font.family: "Showcard Gothic"
        font.pointSize: butExit.pressed ? 34 : 24
        font.bold: true
        text: "EXIT"
        
        MouseArea {
            id: butExit
            anchors.fill: buttonExit
            onClicked: Qt.quit();
        }
    }
    
    RecBack {
        id: recBack
    }
    
}
