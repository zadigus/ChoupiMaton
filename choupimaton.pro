TEMPLATE = app
TARGET = choupimaton

CONFIG += c++11

QT += quick qml multimedia widgets

SOURCES += main.cpp \
    EngineConfigurator.cpp

HEADERS += EngineConfigurator.hpp

RESOURCES += gui/qml/qml.qrc \
 gui/images/images.qrc

INCLUDE_PATH += gui logic

include(choupimaton.pri)
