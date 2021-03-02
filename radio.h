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
    Q_INVOKABLE void setUrlStation();

signals:
    //void radioDoesNotPlay();

public slots:
    void playRadioClicked();
    void pauseRadioClicked();
    void volumeMaxRadioClicked();
    void volumeMinRadioClicked();

private:
    QMediaPlayer *player_radio;
    QString radio_station;
    int radio_volume;
};

#endif // RADIO_H
