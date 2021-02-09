#include "testrpi.h"

#include <QDebug>

bool switch_on = false;

TestRPi::TestRPi(int rpi_pin, int rpi_type, void (*isrInput)(void), QObject *parent) : QObject(parent)
{

    wiringPiSetup();
    pin = rpi_pin;

    value_pwm = 0;

    switch(rpi_type)
    {
        case GPIO_INPUT:
        {
            pinMode(pin, INPUT);
            wiringPiISR(pin, INT_EDGE_BOTH, isrInput);
            break;
        }

        case GPIO_OUTPUT:
        {
            pinMode(pin, OUTPUT);
            break;
        }

        case GPIO_PWM:
        {
            softPwmCreate(pin, value_pwm, 100);
            break;
        }
    }
    //switch_on = false;

}

TestRPi::TestRPi(QObject *parent) : QObject(parent)
{

}

void TestRPi::isrCallback()
{
    if(switch_on){
        emit inputChanged(digitalRead(pin));
    }
  
}

void TestRPi::pinHigh()
{
    if(switch_on){
        digitalWrite(pin, HIGH);
    }
    
    if(switch_on){
        qDebug("pin High");
    }
}

void TestRPi::pinLow()
{
    
    if(switch_on){
        digitalWrite(pin, LOW);
    }
    
    if(switch_on){
        qDebug("pin Low");
    }
}

void TestRPi::setPwmValue(int value)
{
    static int value_temp = 0;
   
    if(switch_on){
        if(value_temp != value) {
            softPwmWrite(pin, value);
            value_temp = value;
        }
    }
    else {
        value_temp = 0;
    }
 /*   
    if(switch_on){
        if(value_temp != value) {
            qDebug() << "PWM" << value;
            value_temp = value;
        }
    }
    else {
        value_temp = 0;
    }
*/
}

void TestRPi::toggleSwitch()
{
    switch_on = !switch_on;

    if(!switch_on){
        digitalWrite(13, LOW);
        softPwmWrite(4, 0);
    }


    if(switch_on){
        qDebug("Switch On");
    }
    else {
        qDebug("Switch Off");
        qDebug() << "pin Low";
        qDebug() << "PWM 0";
    }
}

