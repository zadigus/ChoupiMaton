TEMPLATE = app
TARGET = choupimaton

CONFIG += c++11

QT += quick qml multimedia widgets

PICSPROC_FOLDER = logic/PicturesProcessor
PRINTERMANAGER_FOLDER = logic/PrinterManager
CORE_FOLDER = core
PRINTERSETUP_FOLDER = gui/PrinterSetup

SOURCES += main.cpp \
    EngineConfigurator.cpp \
    AppConfiguration.cpp \
    $${PICSPROC_FOLDER}/PicturesProcessor.cpp \
    $${PICSPROC_FOLDER}/PictureSaver.cpp \
    $${PICSPROC_FOLDER}/PictureLayoutManager.cpp \
    $${CORE_FOLDER}/Utils.cpp \
    $${CORE_FOLDER}/Logger/Logger.cpp \
    $${PRINTERMANAGER_FOLDER}/PrinterManager.cpp \
    $${PRINTERSETUP_FOLDER}/IosPrinterSetup.cpp

HEADERS += EngineConfigurator.hpp \
    AppConfiguration.hpp \
    $${PICSPROC_FOLDER}/PicturesProcessor.hpp \
    $${PICSPROC_FOLDER}/PictureSaver.hpp \
    $${PICSPROC_FOLDER}/PictureLayoutManager.hpp \
    $${CORE_FOLDER}/Utils.hpp \
    $${CORE_FOLDER}/Global.hpp \
    $${CORE_FOLDER}/Logger/Logger.hpp \
    $${PRINTERMANAGER_FOLDER}/PrinterManager.hpp \
    $${PRINTERMANAGER_FOLDER}/PrinterManagerImpl.hpp \
    $${PRINTERSETUP_FOLDER}/IosPrinterSetup.hpp

RESOURCES += gui/qml/qml.qrc \
 gui/images/images.qrc \
 gui/fonts/fonts.qrc

INCLUDEPATH += gui logic core

ios {
    QMAKE_INFO_PLIST = ios/Info.plist
    ios_icon.files = $$files($$PWD/icons/icon*.png)
    launch_image.files = $$files($$PWD/ios/LaunchScreen/softozor.*)
    QMAKE_BUNDLE_DATA += ios_icon launch_image
    OBJECTIVE_HEADERS +=  $${PRINTERMANAGER_FOLDER}/IosPrinterManagerImpl.hpp \
        $${PRINTERSETUP_FOLDER}/IosPrinterData.hpp \
        $${PRINTERSETUP_FOLDER}/IosPrinterSetupImpl.hpp
    OBJECTIVE_SOURCES += $${PRINTERMANAGER_FOLDER}/PrinterManager.mm \
        $${PRINTERMANAGER_FOLDER}/IosPrinterManagerImpl.mm \
        $${PRINTERSETUP_FOLDER}/IosPrinterData.mm \
        $${PRINTERSETUP_FOLDER}/IosPrinterSetupImpl.mm
}
