import QtQuick 2.7
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2
import QtQuick.Dialogs 1.2

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
    source: "qrc:/fonts/Bouquinistes"
  }

  BurgerMenu {
    width: 32
    height: 32
    onHandle: startUI.handle(name)
  }

  Dialog {
    id: needPaperDlg
    visible: printerMgr.needPaper
    contentItem: Rectangle {
      implicitHeight: 100
      implicitWidth: 400
      Text {
        anchors.centerIn: parent
        text: "Merci d'ajouter du papier !"
      }
      MouseArea {
        anchors.fill: parent
        onClicked: {
          needPaperDlg.accepted()
        }
      }
    }
    onAccepted: printerMgr.needPaper = false
  }

  Dialog {
    id: needInkDlg
    visible: printerMgr.needInk
    contentItem: Rectangle {
      implicitHeight: 100
      implicitWidth: 400
      Text {
        anchors.centerIn: parent
        text: "Merci d'ajouter de l'encre !"
      }
      MouseArea {
        anchors.fill: parent
        onClicked: {
          needInkDlg.accepted()
        }
      }
    }
    onAccepted: printerMgr.needInk = false
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
<li>Les quatre photos seront ensuite imprimées et vous pourrez récupérer le souvenir inoubliable de cette soirée à l'extérieur de la cabine.
</ul>
<p>Faites bien attention de regarder vers la caméra si vous ne voulez pas avoir l'air trop cons."
    }

    FontMetrics {
      id: buttonFontMetrics
      font {
        family: explanatoryFont.name
        pixelSize: 50
      }
    }

    Button {
      Layout.alignment: Qt.AlignHCenter

      width: buttonFontMetrics.boundingRect(text).width
      height: buttonFontMetrics.boundingRect(text).height

      text: "Goooooo !"
      font: buttonFontMetrics.font
      onClicked: handle("takePics")

      Rectangle {
        anchors.fill: parent
        color: "transparent"
        border.color: "black"
        border.width: 3
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
