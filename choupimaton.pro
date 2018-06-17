TEMPLATE = app
TARGET = choupimaton

CONFIG += c++11

QT += quick qml multimedia widgets

PICSPROC_FOLDER = logic/PicturesProcessor
PRINTERMANAGER_FOLDER = logic/PrinterManager
PASSWORDMGR_FOLDER = logic/PasswordManager
CORE_FOLDER = core
COMMON_FOLDER = common

SOURCES += main.cpp \
    EngineConfigurator.cpp \
    AppConfiguration.cpp \
    $${PICSPROC_FOLDER}/PicturesProcessor.cpp \
    $${PICSPROC_FOLDER}/PictureSaver.cpp \
    $${PICSPROC_FOLDER}/PictureLayoutManager.cpp \
    $${CORE_FOLDER}/Utils.cpp \
    $${CORE_FOLDER}/Logger/Logger.cpp \
    $${PRINTERMANAGER_FOLDER}/PrinterManager.cpp \
    $${PASSWORDMGR_FOLDER}/PasswordManager.cpp

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
    $${PASSWORDMGR_FOLDER}/PasswordManager.hpp \
    $${COMMON_FOLDER}/ConfigHelpers.hpp

RESOURCES += gui/qml/qml.qrc \
 gui/images/images.qrc \
 gui/fonts/fonts.qrc

INCLUDEPATH += gui logic core gui/ios logic/ios common/ios

ios {
    IOS_PRINTERSETUP_FOLDER = gui/ios/PrinterSetup
    IOS_PRINTERMANAGER_FOLDER = logic/ios/PrinterManager
    IOS_COMMON_DATA_FOLDER = $${COMMON_FOLDER}/ios/Data

    QMAKE_INFO_PLIST = ios/Info.plist
    ios_icon.files = $$files($$PWD/icons/icon*.png)
    launch_image.files = $$files($$PWD/ios/LaunchScreen/softozor.*)
    QMAKE_BUNDLE_DATA += ios_icon launch_image
    xcode_product_bundle_identifier_setting.value = "com.softozor.choupimaton" # this is required because PRODUCT_BUNDLE_IDENTIFIER = com.softozor.choupimaton doesn't work

    HEADERS += $${IOS_PRINTERSETUP_FOLDER}/PrinterSetup.hpp

    SOURCES += $${IOS_PRINTERSETUP_FOLDER}/PrinterSetup.cpp

    OBJECTIVE_HEADERS +=  $${IOS_PRINTERMANAGER_FOLDER}/PrinterManagerImpl.hpp \
        $${IOS_PRINTERMANAGER_FOLDER}/PictureRenderer.hpp \
        $${IOS_COMMON_DATA_FOLDER}/PrinterData.hpp \
        $${IOS_PRINTERSETUP_FOLDER}/PrinterSetupImpl.hpp

    OBJECTIVE_SOURCES += $${IOS_PRINTERMANAGER_FOLDER}/PictureRenderer.mm \
        $${IOS_PRINTERMANAGER_FOLDER}/PrinterManagerImpl.mm \
        $${IOS_COMMON_DATA_FOLDER}/PrinterData.mm \
        $${IOS_PRINTERSETUP_FOLDER}/PrinterSetupImpl.mm
}
