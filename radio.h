#ifndef RADIO_H
#define RADIO_H

#include <QObject>
#include <QMediaPlayer>
#include <QUrl>

class Radio : public QObject
{
    Q_OBJECT
public:
    explicit Radio(QObject *parent = 0);
    //Q_INVOKABLE void setUrlStation();
    Q_INVOKABLE QString getNameTrack1();
    Q_INVOKABLE QString getNameTrack2();
    Q_INVOKABLE QString getNameTrack3();

signals:
    //void radioDoesNotPlay();

public slots:
    void playRadioClicked();
    void playPauseRadioClicked();
    void pauseRadioClicked();
    void setUrlStation(QString);
    //void stateChanged();
    void updateNameTracks();

private:
    QMediaPlayer *player_radio;
    QString radio_station;
    QString name_track1;
    QString name_track2;
    QString name_track3;
    int getStation();
    QString getScraping();
};

#endif // RADIO_H
