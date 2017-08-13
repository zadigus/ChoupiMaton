import QtQuick 2.0
import QtQuick.Controls 2.2

Item {
    property alias value : popup.currentValue
    property alias model : popup.model

    width : 144
    height: 70
    visible: model.length > 0

    Button {
        anchors.fill: parent
        text: popup.currentItem != null ? popup.currentItem.displayName : ""

        onClicked: popup.toggle()
    }

    CameraListPopup {
        id: popup
        anchors.right: parent.left
        anchors.rightMargin: 16
        anchors.top: parent.top
        visible: opacity > 0

        onSelected: popup.toggle()
    }
}
