import QtQuick 2.0
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3

import IosPrinterSetup 1.0

Rectangle {
  id : mainUI

  signal handle(string name)

  anchors.fill: parent

  IosPrinterSetup {
    id: printerSetup
    x: mainUI.width * 0.5
    y: printerNameBtn.y + printerNameBtn.height / 2
    visible: false
    onPrinterDataChanged: {
      printerMgr.setPrinterData(printerSetup.printerData)
    }
  }

  Rectangle {
    id: sideBar

    color: "black"

    width: mainUI.width / 4
    height: mainUI.height
    anchors {
      right: mainUI.right
    }

    ColumnLayout {

      anchors.fill: parent

      Button {
        id: printerNameBtn
        Layout.alignment: Qt.AlignHCenter

        text: printerSetup.printerName
        onClicked: {
          printerSetup.visible = !printerSetup.visible
        }
      }

      Button {
        Layout.alignment: Qt.AlignHCenter

        text: "Close"
        onClicked: {
          printerSetup.visible = false
          handle("start")
        }
      }

    }
  }
}
