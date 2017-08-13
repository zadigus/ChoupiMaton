import QtQuick 2.9
import QtQuick.Window 2.3

Window {
  id: mainWindow

  visibility: "FullScreen"
  visible: true

  property var pages: {
    "start" : "qrc:/qml/Start.qml",
    "takePics" : "qrc:/qml/Camera/PicturesTaker.qml",
    "config" : "qrc:/qml/Camera/CameraConfiguration.qml"
  }

  Loader {
    id: mainLoader
    anchors.fill: parent
    source: pages["start"]
  }

  Connections {
    target: mainLoader.item
    onHandle: mainLoader.source = mainWindow.pages[name]
  }
}
