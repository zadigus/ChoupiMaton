import QtQuick 2.9
import QtQuick.Window 2.3

Window {
  id: mainWindow

  visibility: "FullScreen"
  visible: true

  property var pages: {
    "start" : "qrc:/qml/Start.qml",
    "print" : "qrc:/qml/Print.qml",
    "saveOnly" : "qrc:/qml/SaveOnly.qml",
    "takePics" : "qrc:/qml/Camera/PicturesTaker.qml",
    "cameraConfig" : "qrc:/qml/Camera/CameraConfiguration.qml",
    "printerConfig" : "qrc:/qml/Printer/PrinterConfiguration.qml"
  }

  Loader {
    id: mainLoader
    anchors.fill: parent
    source: pages["print"]
  }

  Connections {
    target: mainLoader.item
    onHandle: mainLoader.source = mainWindow.pages[name]
  }
}
