import QtQuick 2.0

Rectangle {
  id: startUI

  signal handle(string name)

  anchors.fill: parent

  color: "red"

  Rectangle {
    id: explanatoryText
    anchors.centerIn: parent
    width: 0.75 * parent.width
    height: 0.75 * parent.height
    border { color: "black"; width: 3 }
    Text {
      anchors.centerIn: parent
      text: "Explications blablablablaaaaaaa"
    }
  }

  Rectangle {
    anchors.horizontalCenter: parent.horizontalCenter

    anchors.top: explanatoryText.bottom
    anchors.margins: { top: 25 }

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
}

