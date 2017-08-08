import QtQuick 2.0

Rectangle {
  color: "black"

  FontLoader {
    id: explanatoryFont
    source: "qrc:/fonts/RujisHandWriting"
  }

  Text {
    anchors.centerIn: parent
    text: "Camera not available"
    font {
      family: explanatoryFont.name
      pixelSize: 150
    }
    color: "white"
  }

}
