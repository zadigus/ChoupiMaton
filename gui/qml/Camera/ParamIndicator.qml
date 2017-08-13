import QtQuick 2.0
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3

ColumnLayout {

  property alias name : paramName.text
  property alias from: control.from
  property alias to: control.to
  property alias value: control.value
  property alias stepSize: control.stepSize

  spacing: 25

  Text {
    id: paramName
    font: control.font
    Layout.alignment: Qt.AlignHCenter
    color: "white"
  }

  SpinBox {
    id: control
    editable: true

    Layout.alignment: Qt.AlignHCenter

    contentItem: TextInput {
      z: 2
      text: control.textFromValue(control.value, control.locale)

      font: control.font
      color: "#21be2b"
      selectionColor: "#21be2b"
      selectedTextColor: "#ffffff"
      horizontalAlignment: Qt.AlignHCenter
      verticalAlignment: Qt.AlignVCenter

      readOnly: !control.editable
      validator: control.validator
      inputMethodHints: Qt.ImhFormattedNumbersOnly
    }

    up {
      id: upIndic
      indicator: Rectangle {
        x: control.mirrored ? 0 : parent.width - width
        height: parent.height
        implicitWidth: 40
        implicitHeight: 40
        color: upIndic.pressed ? "#e4e4e4" : "#f6f6f6"
        border.color: enabled ? "#21be2b" : "#bdbebf"

        Text {
          text: "+"
          font.pixelSize: control.font.pixelSize * 2
          color: "#21be2b"
          anchors.fill: parent
          fontSizeMode: Text.Fit
          horizontalAlignment: Text.AlignHCenter
          verticalAlignment: Text.AlignVCenter
        }
      }
    }

    down {
      id: downIndic
      indicator: Rectangle {
        x: control.mirrored ? parent.width - width : 0
        height: parent.height
        implicitWidth: 40
        implicitHeight: 40
        color: downIndic.pressed ? "#e4e4e4" : "#f6f6f6"
        border.color: enabled ? "#21be2b" : "#bdbebf"

        Text {
          text: "-"
          font.pixelSize: control.font.pixelSize * 2
          color: "#21be2b"
          anchors.fill: parent
          fontSizeMode: Text.Fit
          horizontalAlignment: Text.AlignHCenter
          verticalAlignment: Text.AlignVCenter
        }
      }
    }

    background: Rectangle {
      implicitWidth: 140
      border.color: "#bdbebf"
    }
  }
}
