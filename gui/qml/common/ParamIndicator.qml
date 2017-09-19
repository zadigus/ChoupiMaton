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

  RowLayout {
    spacing: 10
    Layout.alignment: Qt.AlignHCenter

    Text {
      id: paramName
      Layout.alignment: Qt.AlignLeft
      color: "white"
    }

    Text {
      id: controlDisplay
      Layout.alignment: Qt.AlignRight
      color: "white"
    }
  }

  Slider {
    id: control

    Layout.alignment: Qt.AlignHCenter

    Binding {
      target: controlDisplay
      property: "text"
      value: Math.round(control.value * 10) / 10
    }
  }
}
