import QtQuick 2.0
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3

import IosPrinterSetup 1.0

import "../common" as Common

Rectangle {
  id : mainUI

  signal handle(string name)

  anchors.fill: parent

  color: "black"

  FontLoader {
    id: textFont
    source: "qrc:/fonts/Bouquinistes"
  }

  Image {
    id: printerNotAvailableImg
    anchors.fill: parent
    source: "qrc:/images/PrinterNotAvailable"

    Binding {
      target: printerNotAvailableImg
      property: "visible"
      value: !printerMgr.printerSet
    }
  }

  Rectangle {
    anchors.fill: parent
    color: "black"
    visible: printerMgr.printerSet
    Text {
      anchors.centerIn: parent
      text: "Printer<br>available"
      textFormat: Text.RichText
      horizontalAlignment: Text.AlignHCenter
      color: "white"
      font {
        pixelSize: 100
        family: textFont.name
      }
    }
  }

  IosPrinterSetup {
    id: printerSetup
    x: mainUI.width * 0.5
    y: printerNameBtn.y + printerNameBtn.height / 2
    visible: false
    onPrinterDataChanged: printerMgr.setPrinterData(printerSetup.printerData)
  }

  Rectangle {
    id: sideBar

    color: "transparent"

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
        visible: !disconnectPrinterBtn.visible
        text: printerSetup.printerName
        onClicked: printerSetup.visible = !printerSetup.visible
      }

      Button {
        id: disconnectPrinterBtn
        Layout.alignment: Qt.AlignHCenter
        visible: printerMgr.printerSet
        text: qsTr("<center>Disconnect<br>" + printerSetup.printerName + "</center>")
        onClicked: printerSetup.resetPrinter()
      }

      Common.ParamIndicator {
        id: printDurationParam

        Layout.fillWidth: true
        Layout.alignment: Qt.AlignHCenter

        name: "Print duration [s]"

        from: 1
        to: 120
        value: printerMgr.printDuration / 1000 // we get a value in ms
        stepSize: 10

        Binding {
          target: printerMgr
          property: "printDuration"
          value: printDurationParam.value * 1000 // we need a value in ms
        }
      }

      Common.ParamIndicator {
        id: paperFreqParam

        Layout.fillWidth: true
        Layout.alignment: Qt.AlignHCenter

        name: "Paper frequency [sheets]"

        from: 1
        to: 100
        value: printerMgr.paperFrequency
        stepSize: 1

        Binding {
          target: printerMgr
          property: "paperFrequency"
          value: paperFreqParam.value
        }
      }

      Common.ParamIndicator {
        id: inkFreqParam

        Layout.fillWidth: true
        Layout.alignment: Qt.AlignHCenter

        name: "Ink frequency [sheets]"

        from: 1
        to: 100
        value: printerMgr.inkFrequency
        stepSize: 1

        Binding {
          target: printerMgr
          property: "inkFrequency"
          value: inkFreqParam.value
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
