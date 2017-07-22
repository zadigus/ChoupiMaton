TEMPLATE = app
TARGET = choupimaton

CONFIG += c++11

QT += quick qml multimedia

SOURCES += main.cpp
RESOURCES += gui/qml/qml.qrc \
 gui/images/images.qrc

INCLUDE_PATH += gui logic

include(choupimaton.pri)
