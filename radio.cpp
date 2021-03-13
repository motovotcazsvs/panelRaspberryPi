#include <QProcess>

#include "radio.h"

Radio::Radio(QObject *parent) : QObject(parent)
{
    player_radio = new QMediaPlayer;
    radio_station = "https://air2.radiorecord.ru:9002/rr_128";
    player_radio->setMedia(QUrl(radio_station));
    player_radio->setVolume(100);
    this->updateNameTracks();

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

void Radio::updateNameTracks()
{
    QStringList params;
    QProcess p;
    QString path_scraping = this->getScraping();
    qDebug() << path_scraping;
    //params << "D:/projects/exampleRaspberryPi/panelRaspberryPi/scraping1.py";//для планшета
    //params << "C:/QT_PROJECTS/exampleRaspberryPi/panelRaspberryPi/scraping1.py";//для ноутбука
    params << path_scraping;
    p.start("python", params);
    p.waitForFinished(-1);
    QString p_stdout = QString::fromLocal8Bit(p.readAll());
    p_stdout = p_stdout.simplified();

    p_stdout.remove("ейчас в эфире Радио Рекорд с");
    p_stdout.remove(" Плейлист Радио Рекорд");
    qDebug() << p_stdout;

    QString str_track1 = p_stdout;
    str_track1 = str_track1.left(str_track1.indexOf(":") - 3);
    p_stdout.remove(str_track1);
    p_stdout.remove(p_stdout.left(p_stdout.indexOf(":") + 4));

    QString str_track3 = p_stdout;
    str_track3.remove(str_track3.left(str_track3.indexOf(":") + 4));
    str_track3 = str_track3.left(str_track3.indexOf(":") - 3);

    QString str_track2 = p_stdout;
    str_track2 = str_track2.left(str_track2.indexOf(":") - 3);

    //qDebug() << str_track1 << endl << str_track2 << endl << str_track3;

    name_track1 = str_track1;
    name_track2 = str_track2;
    name_track3 = str_track3;
}

QString Radio::getNameTrack1()
{
    return name_track1;
}

QString Radio::getNameTrack2()
{
    return name_track2;
}

QString Radio::getNameTrack3()
{
    return name_track3;
}

int Radio::getStation()
{
    int return_get_station = 0;
    if(radio_station == "https://air2.radiorecord.ru:9002/rr_128") {return_get_station = 0; qDebug() << return_get_station;}
    else if(radio_station == "https://air2.radiorecord.ru:9003/rr_320") return_get_station = 1;
    else if(radio_station == "https://air2.radiorecord.ru:805/gold_320") return_get_station = 2;
    else if(radio_station == "https://air2.radiorecord.ru:9003/bighits_320") return_get_station = 3;
    else if(radio_station == "https://air2.radiorecord.ru:805/russianhits_320") return_get_station = 4;
    else if(radio_station == "https://air2.radiorecord.ru:805/sd90_320") return_get_station = 5;
    else if(radio_station == "https://air2.radiorecord.ru:805/russiangold_128") return_get_station = 6;
    else if(radio_station == "https://air.radiorecord.ru:805/rv_128") return_get_station = 7;

    return return_get_station;
}

QString Radio::getScraping()
{
    QString return_get_scraping;
    int gs = this->getStation();
    switch (gs) {
    case 0:
        return_get_scraping = "D:/projects/exampleRaspberryPi/panelRaspberryPi/scraping1.py"; //для планшета
        //return_get_scraping = "C:/QT_PROJECTS/exampleRaspberryPi/panelRaspberryPi/scraping1.py";//для ноутбука
        qDebug() << return_get_scraping;
        break;
    case 1:
        return_get_scraping = "D:/projects/exampleRaspberryPi/panelRaspberryPi/scraping1.py"; //для планшета
        //return_get_scraping = "C:/QT_PROJECTS/exampleRaspberryPi/panelRaspberryPi/scraping1.py";//для ноутбука
        break;
    case 2:
        return_get_scraping = "D:/projects/exampleRaspberryPi/panelRaspberryPi/scraping2.py"; //для планшета
        //return_get_scraping = "C:/QT_PROJECTS/exampleRaspberryPi/panelRaspberryPi/scraping2.py";//для ноутбука
        break;
    case 3:
        return_get_scraping = "D:/projects/exampleRaspberryPi/panelRaspberryPi/scraping3.py"; //для планшета
        //return_get_scraping = "C:/QT_PROJECTS/exampleRaspberryPi/panelRaspberryPi/scraping3.py";//для ноутбука
        break;
    case 4:
        return_get_scraping = "D:/projects/exampleRaspberryPi/panelRaspberryPi/scraping4.py"; //для планшета
        //return_get_scraping = "C:/QT_PROJECTS/exampleRaspberryPi/panelRaspberryPi/scraping4.py";//для ноутбука
        break;
    case 5:
        return_get_scraping = "D:/projects/exampleRaspberryPi/panelRaspberryPi/scraping5.py"; //для планшета
        //return_get_scraping = "C:/QT_PROJECTS/exampleRaspberryPi/panelRaspberryPi/scraping5.py";//для ноутбука
        break;
    case 6:
        return_get_scraping = "D:/projects/exampleRaspberryPi/panelRaspberryPi/scraping6.py"; //для планшета
        //return_get_scraping = "C:/QT_PROJECTS/exampleRaspberryPi/panelRaspberryPi/scraping6.py";//для ноутбука
        break;
    case 7:
        return_get_scraping = "D:/projects/exampleRaspberryPi/panelRaspberryPi/scraping7.py"; //для планшета
        //return_get_scraping = "C:/QT_PROJECTS/exampleRaspberryPi/panelRaspberryPi/scraping7.py";//для ноутбука
        break;
    default:
        break;
    }

    return return_get_scraping;
}
