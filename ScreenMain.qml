import QtQuick 2.5
import QtQuick.Window 2.2
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.1
import QtQuick.Controls 1.4

Page {
    id: screenMain

    Image {
        id: backgroundPanel
        anchors.fill: parent
        source: "images/backgroundRPi.jpg"
    }

    Rectangle {
        id: recB6
        width: 150
        height: 150
        color: but6.pressed ? "black" : "transparent"
        border.color: "black"
        border.width: 5
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.rightMargin: 17
        anchors.topMargin: 50

        Image {
            id: imBye
            anchors.fill: recB6
            anchors.margins: 10
            source: "images/off.png"
        }

        MouseArea {
            id: but6
            anchors.fill: recB6
            onClicked: {
                stackView.push(page2);
            }
        }
    }

    Rectangle {
        id: recB5
        width: 150
        height: 150
        color: but5.pressed ? "black" : "transparent"
        border.color: "black"
        border.width: 5        
        anchors.right: recB6.left
        anchors.top: parent.top
        anchors.rightMargin: 17
        anchors.topMargin: 75
        
        Image {
            id: imTest
            anchors.fill: recB5
            source: "images/rpi.png"
        }
        
        MouseArea {
            id: but5
            anchors.fill: recB5
            onClicked: stackView.push(page3);
        }
    }
    
    Rectangle {
        id: recB4
        width: 150
        height: 150
        color: but4.pressed ? "black" : "transparent"
        border.color: "black"
        border.width: 5       
        anchors.right: recB5.left
        anchors.top: parent.top
        anchors.rightMargin: 17
        anchors.topMargin: 85
        
        Image {
            id: imClock
            anchors.fill: recB4
            anchors.margins: 15
            source: "images/clock.jpg"
        }
        
        MouseArea {
            id: but4
            anchors.fill: recB4
            onClicked: {
                
            }
        }
    }
    
    Rectangle {
        id: recB3
        width: 150
        height: 150
        color: but3.pressed ? "black" : "transparent"
        border.color: "black"
        border.width: 5        
        anchors.left: recB2.right
        anchors.top: parent.top
        anchors.leftMargin: 17
        anchors.topMargin: 85
        
        Image {
            id: imWether
            anchors.fill: recB3
            anchors.margins: 15
            source: "images/weather.jpg"
        }
        
        MouseArea {
            id: but3
            anchors.fill: recB3
            onClicked: {
                
            }
        }
    }
    
    Rectangle {
        id: recB2
        width: 150
        height: 150
        color: but2.pressed ? "black" : "transparent"
        border.color: "black"
        border.width: 5
        anchors.left: recB1.right
        anchors.top: parent.top
        anchors.leftMargin: 17
        anchors.topMargin: 75
        
        Image {
            id: imAudioz
            anchors.fill: recB2
            anchors.margins: 15
            source: "images/audioz.jpg"
        }
        
        MouseArea {
            id: but2
            anchors.fill: recB2
            onClicked: {
                
            }
        }
    }
    
    Rectangle {
        id: recB1
        width: 150
        height: 150
        color: but1.pressed ? "black" : "transparent"
        border.color: "black"
        border.width: 5
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 17
        anchors.topMargin: 50
        
        Image {
            id: imVideoz
            anchors.fill: recB1
            anchors.margins: 15
            source: "images/videoz.jpg"
        }
        
        MouseArea {
            id: but1
            anchors.fill: recB1
            onClicked: {
                
            }
        }
    }
    
    Rectangle {
        id: recB7
        width: 150
        height: 150
        color: but7.pressed ? "black" : "transparent"
        border.color: "black"
        border.width: 5
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        anchors.leftMargin: 46
        anchors.bottomMargin: 55
        
        Image {
            id: imNews
            anchors.fill: recB7
            anchors.margins: 15
            source: "images/news.jpg"
        }
        
        MouseArea {
            id: but7
            anchors.fill: recB7
            onClicked: {
                
            }
        }
    }
    
    Rectangle {
        id: recB8
        width: 150
        height: 150
        color: but8.pressed ? "black" : "transparent"
        border.color: "black"
        border.width: 5
        anchors.left: recB7.right
        anchors.bottom: parent.bottom
        anchors.leftMargin: 45
        anchors.bottomMargin: 80
        
        Image {
            id: imTv
            anchors.fill: recB8
            anchors.margins: 15
            source: "images/tv.jpg"
        }
        
        MouseArea {
            id: but8
            anchors.fill: recB8
            onClicked: {
                
            }
        }
    }
    
    Rectangle {
        id: recB9
        width: 150
        height: 150
        color: but9.pressed ? "black" : "transparent"
        border.color: "black"
        border.width: 5
        anchors.left: recB8.right
        anchors.bottom: parent.bottom
        anchors.leftMargin: 46
        anchors.bottomMargin: 85
        
        Image {
            id: imRadio
            anchors.fill: recB9
            anchors.margins: 15
            source: "images/radio.jpg"
        }
        
        MouseArea {
            id: but9
            anchors.fill: recB9
            onClicked: {
                
            }
        }
        
    }
    
    Rectangle {
        id: recB10
        width: 150
        height: 150
        color: but10.pressed ? "black" : "transparent"
        border.color: "black"
        border.width: 5
        anchors.left: recB9.right
        anchors.bottom: parent.bottom
        anchors.leftMargin: 45
        anchors.bottomMargin: 80
        
        Image {
            id: imMusic
            anchors.fill: recB10
            anchors.margins: 15
            source: "images/music.jpg"
        }
        
        MouseArea {
            id: but10
            anchors.fill: recB10
            onClicked: {
                
            }
        }
    }
    
    Rectangle {
        id: recB11
        width: 150
        height: 150
        color: but11.pressed ? "black" : "transparent"
        border.color: "black"
        border.width: 5
        anchors.left: recB10.right
        anchors.bottom: parent.bottom
        anchors.leftMargin: 46
        anchors.bottomMargin: 55
        
        Image {
            id: imVideo
            anchors.fill: recB11
            anchors.margins: 15
            source: "images/video.png"
        }
        
        MouseArea {
            id: but11
            anchors.fill: recB11
            onClicked: {
                
            }
        }   
    }    
}
