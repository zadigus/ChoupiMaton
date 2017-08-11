TEMPLATE = app
TARGET = choupimaton

CONFIG += c++11

QT += quick qml multimedia widgets

PICSPROC_FOLDER = logic/PicturesProcessor
CORE_FOLDER = core

SOURCES += main.cpp \
    EngineConfigurator.cpp \
    $${PICSPROC_FOLDER}/PicturesProcessor.cpp \
    $${PICSPROC_FOLDER}/PictureSaver.cpp \
    $${CORE_FOLDER}/Utils.cpp \
    $${CORE_FOLDER}/Logger/Logger.cpp

HEADERS += EngineConfigurator.hpp \
    $${PICSPROC_FOLDER}/PicturesProcessor.hpp \
    $${PICSPROC_FOLDER}/PictureSaver.hpp \
    $${CORE_FOLDER}/Utils.hpp \
    $${CORE_FOLDER}/Global.hpp \
    $${CORE_FOLDER}/Logger/Logger.hpp

RESOURCES += gui/qml/qml.qrc \
 gui/images/images.qrc \
 gui/fonts/fonts.qrc

INCLUDEPATH += gui logic core

include(choupimaton.pri)
