import QtQuick 2.7

Rectangle {
  id: startUI

  signal handle(string name)

  anchors.fill: parent

  Image {
    anchors.fill: parent
    source: "qrc:/images/kraft.jpg"
  }

  FontLoader {
    id: explanatoryFont
    source: "qrc:/fonts/RujisHandwritingFont.ttf"
  }

  FontLoader {
    id: explanatoryFont2
    source: "qrc:/fonts/RujisHandwritingFontv.2.0.ttf"
  }

  Rectangle {
    id: explanatoryText
    anchors {
      centerIn: parent
      fill: parent
      leftMargin: 50
      rightMargin: 50
      topMargin: 250
      bottomMargin: 100
    }

    color: "transparent"

    Column
    {
      spacing: 5

      Text {
        width: explanatoryText.width
        height: 0.6 * explanatoryText.height
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

      Text {
        width: explanatoryText.width
        height: 0.4 * explanatoryText.height
        font.family: explanatoryFont2.name
        wrapMode: Text.Wrap
        leftPadding: 25
        rightPadding: 25
        textFormat: Text.RichText
        text: "Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.

      Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse"
      }

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
