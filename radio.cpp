#include "radio.h"

Radio::Radio(QObject *parent) : QObject(parent)
{
    player_radio = new QMediaPlayer;
}

void Radio::playRadioClicked()
{
    mPlayer->setMedia(QUrl(radio_station));
    mPlayer->setVolume(radio_volume);
    mPlayer->play();
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

void Radio::getUrlStation()
{

}

void Radio::radioDoesNotPlay()
{

}
