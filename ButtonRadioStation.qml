import QtQuick 2.5
import QtQuick.Window 2.2
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.1
import QtQuick.Controls 1.4

Column {
    id: column
    spacing: 5

    property alias img_b: image_station_dance.source
    property int size_but_radio_station: 70
    property alias name_radio_station: name_radio_station.text

    Rectangle {
        id: but_radio_station
        width: size_but_radio_station
        height: size_but_radio_station
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
            radius: 28
            
            Image {
                id: image_station_dance
                anchors.horizontalCenter: rec2_radio.horizontalCenter
                anchors.verticalCenter: rec2_radio.verticalCenter
                anchors.fill: rec2_radio
                anchors.margins: 5
            }
            
        }        

    }

    Text {
        id: name_radio_station
        color: "white"
        font.pointSize: 5
        anchors.horizontalCenter: but_radio_station.horizontalCenter

    }
}
