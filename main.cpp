#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QtGui/QFont>
#include <QtGui/QFontDatabase>
#include "bye.h"
#include "testrpi.h"
#include <QDebug>


static void isrInput1();
static void isrInput2();

static TestRPi input1(0, GPIO_INPUT, isrInput1);
static TestRPi input2(1, GPIO_INPUT, isrInput2);

static void isrInput1()
{
    input1.isrCallback();
}

static void isrInput2()
{
    input2.isrCallback();
}

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QFontDatabase::addApplicationFont(":/fonts/DejaVuSans.ttf");
    app.setFont(QFont("DejaVu Sans"));

    QQmlApplicationEngine engine;

    TestRPi gpio13(13, GPIO_OUTPUT);
    TestRPi gpio4(4, GPIO_PWM);
    TestRPi on_off;

    QQmlContext* ctx = engine.rootContext();
    Bye shut;
    ctx->setContextProperty("context", &shut);
    ctx->setContextProperty("sw", &on_off);

    ctx->setContextProperty("input1", &input1);
    ctx->setContextProperty("input2", &input2);
    ctx->setContextProperty("output", &gpio13);
    ctx->setContextProperty("pwm_led", &gpio4);

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));


    return app.exec();
}
