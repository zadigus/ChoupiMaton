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
    source: "qrc:/fonts/RujisHandWriting"
  }

  Timer {
    id: timer

    interval: appConfig.printTime
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
      text: "Impression en cours ..."
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
      text: "Vos tronches de cake sont difficiles à imprimer ... <br>Ca va prendre un certain temps mais l'attente en vaut la chandelle, croyez-moi."
    }
  }

//  Component.onCompleted: printerMgr.print(picsProcessor.pathToPicture)
}
