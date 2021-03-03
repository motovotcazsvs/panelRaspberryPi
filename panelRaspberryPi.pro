TEMPLATE = app

QT += qml quick multimedia
CONFIG += c++11

SOURCES += main.cpp \
    bye.cpp \
    testrpi.cpp \
    radio.cpp

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
    DashBoard.qml \
    ButtonRadioStation.qml

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

HEADERS += \
    bye.h \
    testrpi.h \
    radio.h
