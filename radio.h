#ifndef RADIO_H
#define RADIO_H

#include <QObject>
#include <QMediaPlayer>

class Radio : public QObject
{
    Q_OBJECT
public:
    explicit Radio(QObject *parent = 0);

signals:

public slots:

private:
    QMediaPlayer *player;
};

#endif // RADIO_H
