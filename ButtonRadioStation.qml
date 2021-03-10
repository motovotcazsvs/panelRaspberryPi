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
    property string radio_station: ""
    property real num_radio: 0

    function offRadioFunc(){
        butDanceRadio.r1 = false
        buttonRadioStation1.r2 = false
        buttonRadioStation2.r3 = false
        buttonRadioStation3.r4 = false
        buttonRadioStation4.r5 = false
        buttonRadioStation5.r6 = false
        buttonRadioStation6.r7 = false
    }

    function numRadioFunc(){
        if (num_radio == 1){
            offRadioFunc();
            butDanceRadio.r1 = true
        }
        else if (num_radio == 2){
            offRadioFunc();
            buttonRadioStation1.r2 = true
        }
        else if (num_radio == 3){
            offRadioFunc();
            buttonRadioStation2.r3 = true
        }
        else if (num_radio == 4){
            offRadioFunc();
            buttonRadioStation3.r4 = true
        }
        else if (num_radio == 5){
            offRadioFunc();
            buttonRadioStation4.r5 = true
        }
        else if (num_radio == 6){
            offRadioFunc();
            buttonRadioStation5.r6 = true
        }
        else if (num_radio == 7){
            offRadioFunc();
            buttonRadioStation6.r7 = true
        }
    }

    Rectangle {
        id: but_radio_station
        width: size_but_radio_station
        height: size_but_radio_station
        border.color: "white"
        border.width: 1
        radius: 35
        color: "black"

        MouseArea {
            id: press_but_radio_station
            anchors.fill: but_radio_station
            onClicked: {
                radio.setUrlStation(radio_station);
                radio.playRadioClicked();
                butPauseRadio.play_pause = true
                numRadioFunc();
            }
        }
        
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
