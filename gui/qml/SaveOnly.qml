import QtQuick 2.7
import QtQuick.Layouts 1.3

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

    interval: 15000
    running: true
    repeat: false

    onTriggered: {
      handle("start")
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
      text: "Sauvegarde en cours ..."
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
      text: "Vu que l'imprimante nous a lachés, vos tronches de cake sont simplement sauvegardées ... <br>Elles seront publiées sur le compte Dropbox des mariés dès que possible."
    }
  }
}
