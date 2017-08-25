import QtQuick 2.7
import QtQuick.Layouts 1.3

import PrinterSetup 1.0

Rectangle {
  id: startUI

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

  BurgerMenu {
    width: 32
    height: 32
    onHandle: startUI.handle(name)
  }

  ColumnLayout {

    anchors.fill: parent

    spacing: 15

    Text {
      Layout.alignment: Qt.AlignHCenter
      font {
        family: titleFont.name
        pixelSize: 150
      }
      text: "Le Choupimaton"
    }

    Text {
      Layout.alignment: Qt.AlignHCenter
      Layout.fillWidth: true
      Layout.leftMargin: 50
      Layout.rightMargin: 50
      font {
        family: explanatoryFont.name
        bold: true
        pixelSize: 25
      }
      wrapMode: Text.Wrap
      leftPadding: 25
      rightPadding: 25
      textFormat: Text.RichText
      text: "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet."
    }

    Rectangle {
      Layout.alignment: Qt.AlignHCenter

      width: 150
      height: 50

      border { color: "black"; width: 3 }

      Text {
        anchors.centerIn: parent
        text: "C'est partiiiii !"
      }

      MouseArea {
        anchors.fill: parent
        onClicked: handle("takePics")
      }
    }

    PrinterSetup {
      x: 500
      y: 500
    }

  }
}
