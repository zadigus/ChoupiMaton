import QtQuick 2.9
import QtQuick.Window 2.3

import "./MenuNames.js" as MenuNames

Window {
  id: mainWindow

  visibility: "FullScreen"
  visible: true

  Loader {
    id: mainLoader
    anchors.fill: parent
    source: appConfig.settingsFileExists ? MenuNames.START : MenuNames.ERROR_SETTINGS_MISSING
  }

  Connections {
    target: mainLoader.item
    onHandle: mainLoader.source = name
  }
}
