import QtQuick 2.7
import QtQuick.Layouts 1.3

import IosPrinterSetup 1.0

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
        pixelSize: 35
      }
      horizontalAlignment: Text.AlignHCenter
      wrapMode: Text.Wrap
      leftPadding: 25
      rightPadding: 25
      textFormat: Text.RichText
      text: "Bon alors le principe est assez simple pour la plupart d'entre vous. Quand vous aurez appuyé sur le bouton ci-dessous, vous serez pris en photo.
Nous allons procéder de la façon suivante:<br>
<ul>
<li><b>Quatre</b> photos de vous seront prises à un intervalle de <b>trois</b> secondes indiquées par un compte à rebours.
<li>Les quatre photos seront ensuite imprimées et vous pourrez récupérer le souvenir inoubliable de cette soirée a l'exterieur de la cabine.
</ul>
<p>Faites bien attention de regarder vers la caméra si vous voulez par avoir l'air trop cons."
    }

    Rectangle {
      Layout.alignment: Qt.AlignHCenter

      width: 150
      height: 50

      visible: printerMgr.isPrinterSet()

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
}
