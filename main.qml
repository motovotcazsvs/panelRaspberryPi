import QtQuick 2.5
import QtQuick.Window 2.2
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.1
import QtQuick.Controls 1.4

Window {
    id: w
    visible: true
    width: 1024
    height: 600
    //flags: Qt.FramelessWindowHint
    StackView {
        id: stackView
        anchors.fill: parent
        initialItem: screenMain
        delegate: StackViewDelegate {
            pushTransition: StackViewTransition {
            }
        }
    }

    ScreenMain {
        id: screenMain
    }

    Page2 {
        id: page2
    }

    Page {
        id: page3
        visible: false

        Image {
            id: imageP3
            anchors.fill: parent
            source: "images/bgd2.jpg"
            opacity: 0.5
        }

        RecBack {
            id: recBack2
        }

        Rectangle {
            id: recDigIn
            anchors.right: parent.right
            anchors.rightMargin: 20
            //width: 775
            height: 250
            border.color: "black"
            border.width: 5
            anchors.left: recBack2.left
            anchors.leftMargin: 120
            anchors.top: parent.top
            anchors.topMargin: 20
            color: "transparent"

            Text {
                id: labelOnOff
                color: "#2a17f7"
                text: "OFF / ON"
                font.bold: true
                font.pointSize: 10
                anchors.top: recDigIn.top
                anchors.topMargin: 10
                anchors.horizontalCenter: recDigIn.horizontalCenter
            }

            RecSwitch {
                id: recSwitch
            }

            RecButInp {
                id: recButInp
            }

            RecButInp2 {
                id: recButInp2
            }

            Text {
                id: labelButInp
                text: "DIGITAL INPUT BUTTONS"
                font.bold: true
                font.pointSize: 8
                color: "#2a17f7"
                transform: Rotation {
                    angle: 90
                }
                anchors.left: recDigIn.right
                anchors.leftMargin: -15
                anchors.top: recDigIn.top
                anchors.topMargin: 18
            }

            Rectangle {
                id: recRtc
                anchors.right: labelOnOff.left
                anchors.left: recDigIn.left
                anchors.top: recDigIn.top
                anchors.bottom: recDigIn.bottom
                color: "transparent"
                anchors.margins: 20
                border.color: "black"
                border.width: 5

                Text {
                    id: labelRecRtc
                    text: "RTC DS3231"
                    color: "#2a17f7"
                    font.bold: true
                    font.pointSize: 10
                    anchors.top: recRtc.top
                    anchors.topMargin: 10
                    anchors.horizontalCenter: recRtc.horizontalCenter
                }

                Label {
                    id: labelDs3231
                    text: 24 + " °C"
                    font.bold: true
                    color: "red"
                    font.pointSize: 30
                    anchors.centerIn: recRtc
                }
            }

            Rectangle {
                id: recTempSensor
                anchors.top: recSwitch.bottom
                anchors.right: recButInp.left
                anchors.left: recRtc.right
                anchors.bottom: recDigIn.bottom
                color: "transparent"
                anchors.margins: 20
                border.color: "black"
                border.width: 5

                Text {
                    id: labelRecTempSensor
                    text: "TEMPERATURE SENSOR DS18B20"
                    color: "#2a17f7"
                    font.bold: true
                    font.pointSize: 8
                    anchors.top: recTempSensor.top
                    anchors.topMargin: 10
                    anchors.horizontalCenter: recTempSensor.horizontalCenter
                }

                Label {
                    id: labelDs18b20
                    text: 24 + " °C"
                    font.bold: true
                    color: "red"
                    font.pointSize: 30
                    anchors.centerIn: recTempSensor
                }
            }
        }

        Rectangle {
            id: recDigOut
            anchors.top: recBack2.bottom
            anchors.left: parent.left
            anchors.right: recDigIn.left
            anchors.bottom: parent.bottom
            anchors.margins: 20
            color: "transparent"
            border.color: "black"
            border.width: 5

            Rectangle {
                id: recButOut
                anchors.top: labelButLed.bottom
                anchors.topMargin: 10
                anchors.left: recDigOut.left
                anchors.right: recDigOut.right
                height: 75
                anchors.margins: butOutLed.pressed ? 0 : 20
                border.color: "black"
                border.width: 5

                Image {
                    id: imageButOut
                    anchors.fill: recButOut
                    source: "images/button.png"
                    anchors.margins: 5
                }

                MouseArea {
                    id: butOutLed
                    anchors.fill: recButOut
                    onPressed: output.pinHigh();
                    onReleased: output.pinLow();
                }
            }

            Text {
                id: labelButLed
                text: "BUTTON LED"
                color: "#2a17f7"
                font.bold: true
                font.pointSize: 6
                anchors.top: recDigOut.top
                anchors.topMargin: 10
                anchors.horizontalCenter: recDigOut.horizontalCenter
            }

            Rectangle {
                id: recSliderBackgraund
                anchors.bottom: recDigOut.bottom
                anchors.horizontalCenter: recDigOut.horizontalCenter
                anchors.bottomMargin: 10
                radius: 18
                width: 20
                anchors.top: recButOut.bottom
                anchors.topMargin: 50
                border.color: "black"
                border.width: 2
                color: "white"

                Rectangle {
                    id: recSliderFilled
                    anchors.bottom: recSliderBackgraund.bottom
                    anchors.left: recSliderBackgraund.left
                    anchors.right: recSliderBackgraund.right
                    anchors.top: recSliderCircle.top
                    radius: 18
                    color: "red"
                    border.color: "black"
                    border.width: 2
                }

                Rectangle {
                    id: recSliderCircle
                    height: 40
                    width: 40
                    anchors.horizontalCenter: recSliderFilled.horizontalCenter
                    radius: 20
                    color: "red"
                    border.color: "black"
                    border.width: 2

                    MouseArea {
                        id: dragCircleSlider
                        drag.target: recSliderCircle
                        anchors.fill: parent
                        drag.axis: Drag.YAxis
                        drag.minimumY: 0
                        drag.maximumY: 230
                        onPositionChanged: pwm_led.setPwmValue(labelValuePwm.value_pwm)
                    }
                }
            }

            Label {
                id: labelValuePwm
                property int value_pwm: ((230 - recSliderCircle.y) * 100) / 230
                text: value_pwm + "%"
                font.bold: true
                color: "red"
                font.pointSize: 10
                anchors.horizontalCenter: recDigOut.horizontalCenter
                anchors.top: recButOut.bottom
                anchors.topMargin: 20
            }

            Text {
                id: labelSlider
                text: "SLIDER LED PWM"
                font.bold: true
                color: "#2a17f7"
                font.pointSize: 8
                anchors.left: recDigOut.left
                anchors.leftMargin: 13
                anchors.bottom: recDigOut.bottom
                anchors.bottomMargin: 78
                transform: Rotation {
                    angle: -90
                }
            }
        }

        Rectangle {
            id: recDashboard
            color: "transparent"
            border.color: "black"
            border.width: 5
            anchors.top: recDigIn.bottom
            anchors.left: recDigOut.right
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.margins: 20

            Text {
                id: labelDashboard
                text: "ANALOG INPUT - DASHBOARD"
                color: "#2a17f7"
                font.bold: true
                font.pointSize: 10
                anchors.top: recDashboard.top
                anchors.topMargin: 10
                anchors.horizontalCenter: recDashboard.horizontalCenter
            }

            DashBoard {
                id: dashBoard
            }
        }        
    }

    Page {
        id: page4
        visible: false

        Rectangle {
            id: fon_radio
            height: 600
            width: 350
            anchors.horizontalCenter: parent.horizontalCenter
            color: "black"

            Rectangle {
                id: zastavka_record
                height: 84
                width: 151
                anchors.horizontalCenter: parent.horizontalCenter

                Image {
                    id: image_zastavka_record
                    anchors.fill: zastavka_record
                    source: "images/record.png"
                }
            }

            Text {
                id: vefire
                text: "В эфире:"
                color: "green"
                font.pointSize: 10
                anchors.top: zastavka_record.bottom
                anchors.topMargin: 3
                //anchors.horizontalCenter: fon_radio.horizontalCenter
            }

            Column  {
               id: columnvefire
               anchors.top: vefire.bottom

               Text {
                   text: "string1 gjhghjgj gjhgjgjhjhhk jhk"
                   color: "green"
                   font.pointSize: 8
               }

               Text {
                   text: "string2 gjhghjgj gjhgjgjhjhhk jhk"
                   color: "green"
                   font.pointSize: 8
               }

               Text {
                   text: "string3 gjhghjgj gjhgjgjhjhhk jhk"
                   color: "green"
                   font.pointSize: 8
               }
            }

            ButtonRadioStation {
                id: butDanceRadio

                x: fon_radio.width / 2 - 35
                y: 200
                img_b: "images/danceradio.png"
                //img_b: "images/danceradio2.png"
                name_radio_station: "Record"
                radio_station: "https://air2.radiorecord.ru:9003/rr_320"
                num_radio: 1
            }

            Grid {
                id: grid
                anchors.horizontalCenter: fon_radio.horizontalCenter
                anchors.top: butDanceRadio.bottom
                anchors.topMargin: 20

                rows: 2
                rowSpacing: 10
                columnSpacing: 60
                //x: 30

                ButtonRadioStation {
                    id: buttonRadioStation1

                    img_b1: "images/gold.png"
                    //img_b: "images/gold2.svg"
                    name_radio_station: "Record Gold"
                    radio_station: "https://air2.radiorecord.ru:805/gold_320"
                    num_radio: 2
                }

                ButtonRadioStation {
                    id: buttonRadioStation2

                    //img_b: "images/bighits.png"
                    img_b: "images/bighits2.svg"
                    name_radio_station: "Big Hits"
                }

                ButtonRadioStation {
                    id: buttonRadioStation3

                    //img_b: "images/russianhits.png"
                    img_b: "images/russianhits2.svg"
                    name_radio_station: "Russian Hits"
                }

                ButtonRadioStation {
                    id: buttonRadioStation4

                    //img_b: "images/sd90.png"
                    img_b: "images/sd902.svg"
                    name_radio_station: "Супер<br>дискотека 90-х"
                }

                ButtonRadioStation {
                    id: buttonRadioStation5

                    //img_b: "images/russiangold.png"
                    img_b: "images/russiangold2.svg"
                    name_radio_station: "Russian Gold"
                }

                ButtonRadioStation {
                    id: buttonRadioStation6

                    //img_b: "images/rv.png"
                    img_b: "images/rv2.svg"
                    name_radio_station: "Руки Вверх!"
                }

            }

            Rectangle {
                id: butPauseRadio

                property bool play_pause: true

                anchors.top: grid.bottom
                anchors.topMargin: 20
                anchors.horizontalCenter: fon_radio.horizontalCenter
                width: butDanceRadio.size_but_radio_station
                height: butDanceRadio.size_but_radio_station
                radius: butDanceRadio.size_but_radio_station / 2
                border.color: "white"
                border.width: 1
                color: "black"

                MouseArea {
                    id: pressButPauseRadio
                    anchors.fill: butPauseRadio
                    onClicked: {
                        butPauseRadio.play_pause = !butPauseRadio.play_pause
                        if (butPauseRadio.play_pause) radio.playPauseRadioClicked();
                        else radio.pauseRadioClicked();

                    }
                }

                Rectangle {
                    id: recbutpause
                    width: 56
                    height: 56
                    radius: 28
                    anchors.centerIn: butPauseRadio
                    color: butPauseRadio.play_pause ? "#343a40" : "#ff6000"
                }

                Row {
                    id: row
                    visible: butPauseRadio.play_pause
                    spacing: 5
                    anchors.horizontalCenter: butPauseRadio.horizontalCenter
                    anchors.verticalCenter: butPauseRadio.verticalCenter

                    Rectangle {
                        width: 7
                        height: 25
                        color: "white"
                    }

                    Rectangle {
                        width: 7
                        height: 25
                        color: "white"
                    }
                }

                Image {
                    id: radio_play
                    visible: !butPauseRadio.play_pause
                    anchors.fill: recbutpause
                    source: "images/playrecord.png"
                    anchors.margins: 15
                    anchors.left: recbutpause.left
                    anchors.leftMargin: 20
                }

            }

        }

        RecBack {
            id: recBack3  
        }
    }
}
