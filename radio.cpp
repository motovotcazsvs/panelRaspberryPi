#include "radio.h"

Radio::Radio(QObject *parent) : QObject(parent)
{
    player_radio = new QMediaPlayer;
    radio_station = "https://air2.radiorecord.ru:9002/rr_128";
    radio_volume = 50;
}

void Radio::playRadioClicked()
{
    player_radio->setMedia(QUrl(radio_station));
    player_radio->setVolume(radio_volume);
    player_radio->play();
}

void Radio::pauseRadioClicked()
{

}

void Radio::volumeMaxRadioClicked()
{

}

void Radio::volumeMinRadioClicked()
{

}

void Radio::setUrlStation()
{

}

/*void Radio::radioDoesNotPlay()
{

}*/
