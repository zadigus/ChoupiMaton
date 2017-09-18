import QtQuick 2.9
import QtQuick.Controls 2.2

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
      onTriggered: handle("cameraConfig")
    }

    MenuItem {
      text: qsTr("Printer...")
      onTriggered: handle("printerConfig")
    }

    MenuItem {
      text: qsTr("Quit")
      onTriggered: Qt.quit()
    }
  }
}
