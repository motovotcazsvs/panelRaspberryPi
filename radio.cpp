#include "radio.h"

Radio::Radio(QObject *parent) : QObject(parent)
{
    player_radio = new QMediaPlayer;
    radio_station = "https://air2.radiorecord.ru:9002/rr_128";
    player_radio->setMedia(QUrl(radio_station));
    player_radio->setVolume(100);

}

void Radio::playRadioClicked()
{
    player_radio->stop();
    player_radio->setMedia(QUrl(radio_station));
    player_radio->play();
}

void Radio::playPauseRadioClicked()
{
    player_radio->play();
}

void Radio::pauseRadioClicked()
{
    player_radio->pause();
}


void Radio::setUrlStation(QString str)
{
    radio_station = str;
}

/*void Radio::radioDoesNotPlay()
{

}*/
