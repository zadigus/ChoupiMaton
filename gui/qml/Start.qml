import QtQuick 2.7
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2

import IosPrinterSetup 1.0

import "./MenuNames.js" as MenuNames

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
    source: "qrc:/fonts/Bouquinistes"
  }

  BurgerMenu {
    width: 32
    height: 32
    onHandle: popup.run(name)
  }

  PasswordPopup {
    id: popup

    x: (startUI.width - width) / 2
    y: (startUI.height - height) / 2

    onAccepted: {
      popup.close()
      popup.name == MenuNames.QUIT ? Qt.quit() : startUI.handle(popup.name)
    }
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
      text: appConfig.fotozorInstanceName
    }

    Text {
      Layout.alignment: Qt.AlignHCenter
      Layout.fillWidth: true
      Layout.leftMargin: 50
      Layout.rightMargin: 50
      font {
        family: explanatoryFont.name
        bold: true
        pixelSize: 35
      }
      horizontalAlignment: Text.AlignHCenter
      wrapMode: Text.Wrap
      leftPadding: 25
      rightPadding: 25
      textFormat: Text.RichText
      text: appConfig.introductionText
    }

    FontMetrics {
      id: buttonFontMetrics
      font {
        family: explanatoryFont.name
        pixelSize: 50
      }
    }

    Rectangle {
      width: 210
      height: 95
      color: "transparent"
      Layout.alignment: Qt.AlignHCenter
      Image {
        id: goBtn
        signal clicked
        source: "qrc:/images/Go"
        anchors.fill: parent
        MouseArea {
          id: mouseArea
          anchors.fill: parent
          onClicked: goBtn.clicked()
        }
        fillMode:Image.PreserveAspectFit
        onClicked: {
          handle(MenuNames.TAKE_PICS)
        }
        states: State {
          name: "pressed"; when: mouseArea.pressed
          PropertyChanges {
            target: goBtn
            source: "qrc:/images/GoPressed"
          }
        }
      }
    }

    Text {
      Layout.alignment: Qt.AlignHCenter
      visible: !printerMgr.printerSet
      text: "No printer available!"
      font {
        pixelSize: 15
        family: explanatoryFont.name
      }
      color: "black"

      SequentialAnimation on color {
        loops: Animation.Infinite
        running: true

        ColorAnimation {
          from: "black"
          to: "transparent"
          duration: 1000
        }

        ColorAnimation {
          from: "transparent"
          to: "black"
          duration: 1000
        }
      }
    }

  }
}
