import QtQuick 2.7
import QtQuick.Layouts 1.3

Rectangle {
  color: "transparent"
  width: 315
  height: 341.5
  Layout.alignment: Qt.AlignHCenter
  AnimatedImage {
    anchors.fill: parent
    source: "qrc:/images/Loading"
    fillMode:Image.PreserveAspectFit
  }
}
