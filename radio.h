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

signals:

public slots:
    void playRadioClicked();
    void pauseRadioClicked();
    void volumeMaxRadioClicked();
    void volumeMinRadioClicked();

private:
    QMediaPlayer *player_radio;
    QUrl radio_station;
    int radio_volume;
};

#endif // RADIO_H