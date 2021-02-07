#include "bye.h"

Bye::Bye(QObject *parent) : QObject(parent)
{

}

void Bye::funcShotdown()
{
    //system("shutdown -h now");
    qDebug("ВЫКЛЮЧАЮ Raspberry Pi.");
}

void Bye::funcReboot()
{
    //system("shutdown -r now");
    qDebug("ПЕРЕЗАГРУЖАЮ Raspberry Pi.");
}
