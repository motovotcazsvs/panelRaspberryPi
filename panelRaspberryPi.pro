TEMPLATE = app

QT += qml quick
CONFIG += c++11

SOURCES += main.cpp \
    bye.cpp \
    testrpi.cpp

RESOURCES += qml.qrc

OTHER_FILES += \
    Page2.qml \
    ScreenMain.qml \
    RecBack.qml \
    RecSwitch.qml \
    RecButInp.qml \
    RecButInp2.qml \
    DashboardGaugeStyle.qml \
    IconGaugeStyle.qml \
    TachometerStyle.qml \
    TurnIndicator.qml \
    ValueSource.qml \
    DashBoard.qml

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

LIBS += -L"/home/qtdev/raspi4/sysroot/usr/lib"
LIBS += -lwiringPi

# Default rules for deployment.
#qnx: target.path = /tmp/$${TARGET}/bin
#else: unix:!android: target.path = /opt/$${TARGET}/bin
#!isEmpty(target.path): INSTALLS += target

target.path = /home/pi/WiringTest/bin
INSTALLS += target
# Default rules for deployment.
#include(deployment.pri)

HEADERS += \
    bye.h \
    testrpi.h
