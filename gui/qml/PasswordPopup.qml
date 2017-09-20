import QtQuick 2.7
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2

Popup {
  id: popup

  signal accepted

  property string name

  modal: true
  focus: true
  background: Rectangle {
    implicitWidth: 200
    implicitHeight: 200
    border.color: "black"
  }

  contentItem: ColumnLayout {
    spacing: 5
    TextField {
      id: password
      Layout.alignment: Qt.AlignHCenter
      echoMode: TextInput.Password
      placeholderText: qsTr("Enter password")
      onTextChanged: {
        if(passwordMgr.check(text))
        {
          password.clear()
          popup.accepted()
        }
      }
    }
    Button {
      Layout.alignment: Qt.AlignHCenter
      text: qsTr("Cancel")
      onClicked: {
        password.clear()
        popup.close()
      }
    }
  }

  closePolicy: Popup.NoAutoClose

  function run(name)
  {
    popup.name = name
    popup.open()
  }
}
