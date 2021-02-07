#ifndef BYE_H
#define BYE_H

#include <QObject>

class Bye : public QObject
{
    Q_OBJECT
public:
    explicit Bye(QObject *parent = nullptr);
    Q_INVOKABLE void funcShotdown();
    Q_INVOKABLE void funcReboot();

signals:

public slots:

private:

};
#endif // BYE_H
