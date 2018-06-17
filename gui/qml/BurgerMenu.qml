import QtQuick 2.9
import QtQuick.Controls 2.2

import "./MenuNames.js" as MenuNames

Rectangle {
  id: burgerMenu

  signal clicked
  signal handle(string name)

  color: "transparent"

  Image {
    anchors.fill: parent
    source: "qrc:/images/Burger"
  }

  onClicked: menu.open()

  MouseArea {
    anchors.fill: parent
    onClicked: burgerMenu.clicked()
  }

  Menu {
    id: menu

    y: burgerMenu.height

    MenuItem {
      text: qsTr("Camera...")
      onTriggered: handle(MenuNames.CAMERA_CONFIG)
    }

    MenuItem {
      text: qsTr("Printer...")
      onTriggered: handle(MenuNames.PRINTER_CONFIG)
    }

    MenuItem {
      text: qsTr("Quit")
      onTriggered: handle(MenuNames.QUIT)
    }
  }
}
