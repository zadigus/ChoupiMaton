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
        text: popup.currentItem.width + "x" + popup.currentItem.height

        onClicked: popup.toggle()
    }

    ResolutionListPopup {
        id: popup
        anchors.right: parent.left
        anchors.rightMargin: 16
        anchors.verticalCenter: parent.verticalCenter
        visible: opacity > 0

        onSelected: popup.toggle()
    }
}
