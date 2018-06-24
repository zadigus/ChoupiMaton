import QtQuick 2.7
import QtQuick.Layouts 1.3

import "./MenuNames.js" as MenuNames

Rectangle {
  id: mainUI

  signal handle(string name)

  anchors.fill: parent

  Image {
    anchors.fill: parent
    source: "qrc:/images/Kraft"
  }

  FontLoader {
    id: titleFont
    source: "qrc:/fonts/AlexBrush"
  }

  FontLoader {
    id: explanatoryFont
    source: "qrc:/fonts/Bouquinistes"
  }

  Timer {
    id: timer

    interval: appConfig.savingTime
    running: true
    repeat: false

    onTriggered: {
      handle(MenuNames.START)
    }
  }

  ColumnLayout {

    anchors.fill: parent

    spacing: 15

    Text {
      Layout.alignment: Qt.AlignHCenter
      font {
        family: titleFont.name
        pixelSize: 125
      }
      text: appConfig.savingTitle
    }

    WaitingSoftozor {
      Layout.alignment: Qt.AlignHCenter
      Layout.leftMargin: -150
    }

    Text {
      Layout.alignment: Qt.AlignHCenter
      Layout.fillWidth: true
      Layout.leftMargin: 50
      Layout.rightMargin: 50
      font {
        family: explanatoryFont.name
        bold: true
        pixelSize: 50
      }
      horizontalAlignment: Text.AlignHCenter
      wrapMode: Text.Wrap
      leftPadding: 25
      rightPadding: 25
      textFormat: Text.RichText
      text: appConfig.savingText
    }
  }
}
