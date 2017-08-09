TEMPLATE = app
TARGET = choupimaton

CONFIG += c++11

QT += quick qml multimedia widgets

SOURCES += main.cpp \
    EngineConfigurator.cpp \
    logic/PicturesProcessor/PicturesProcessor.cpp

HEADERS += EngineConfigurator.hpp \
    logic/PicturesProcessor/PicturesProcessor.hpp

RESOURCES += gui/qml/qml.qrc \
 gui/images/images.qrc \
 gui/fonts/fonts.qrc

INCLUDEPATH += gui logic

include(choupimaton.pri)
