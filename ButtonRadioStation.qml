import QtQuick 2.5
import QtQuick.Window 2.2
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.1
import QtQuick.Controls 1.4

Item {
    id: root

    Rectangle {
        id: but_radio_station
        width: 70
        height: 70
        border.color: "white"
        border.width: 1
        radius: 35
        color: "black"
        
        Rectangle {
            id: rec2_radio
            width: 56
            height: 56
            color: "#343a40"
            anchors.horizontalCenter: but_radio_station.horizontalCenter
            anchors.verticalCenter: but_radio_station.verticalCenter
            radius: 38
            
            Image {
                id: image_station_dance
                //source: "images/danceradio.png"
                source: "images/danceradio2.png"
                anchors.horizontalCenter: rec2_radio.horizontalCenter
                anchors.verticalCenter: rec2_radio.verticalCenter
                anchors.fill: rec2_radio
                anchors.margins: 5
            }
            
        }
    }
}
