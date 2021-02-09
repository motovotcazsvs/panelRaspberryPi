#include "bye.h"

Bye::Bye(QObject *parent) : QObject(parent)
{

}

void Bye::funcShotdown()
{
    system("shutdown -h now");
}

void Bye::funcReboot()
{
    system("shutdown -r now");
}
