TEMPLATE = app

CONFIG += c++11

TARGET = choupimaton

QT += quick qml multimedia

SOURCES += main.cpp
RESOURCES += gui/qml/qml.qrc \
  gui/images/images.qrc

INCLUDEPATH += gui \
    logic
