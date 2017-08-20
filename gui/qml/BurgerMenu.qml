import QtQuick 2.7
import QtQuick.Controls 2.2

Button {
  id: burgerMenu

  signal handle(string name)

  Image {
    anchors.fill: parent
    source: "qrc:/images/Burger"
  }

  onClicked: menu.open()
  Menu {
    id: menu

    y: burgerMenu.height

    MenuItem {
      text: qsTr("Configure...")
      onTriggered: handle("config")
    }

    MenuItem {
      text: qsTr("Configure printer...")
      onTriggered: printerMgr.setupPrinter()
    }

    MenuItem {
      text: qsTr("Quit")
      onTriggered: Qt.quit()
    }
  }
}
