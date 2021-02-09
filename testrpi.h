#ifndef TESTRPI_H
#define TESTRPI_H

#include <QObject>

#include "wiringPi.h"
#include "softPwm.h"

#define GPIO_INPUT   0
#define GPIO_OUTPUT  1
#define GPIO_PWM     2


class TestRPi: public QObject
{
    Q_OBJECT
public:
    explicit TestRPi(int rpi_pin, int rpi_type, void (*isrInput)(void) = nullptr, QObject *parent = nullptr);
    explicit TestRPi(QObject *parent = nullptr);
    void isrCallback();

signals:
    void inputChanged(int value);

public slots:
    void pinHigh();
    void pinLow();
    void setPwmValue(int);
    void toggleSwitch();


private:
    int value_pwm;
    int pin;


};
#endif // TESTRPI_H
