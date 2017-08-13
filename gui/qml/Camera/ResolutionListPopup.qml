import QtQuick 2.0

Popup {
  id: listPopup

  property alias model : view.model
  property variant currentValue
  property variant currentItem : model[view.currentIndex]

  property int itemWidth : 200
  property int itemHeight : 50

  width: itemWidth + view.anchors.margins * 2
  height: view.count * itemHeight + view.anchors.margins * 2

  signal selected

  function indexForValue(value)
  {
    for (var i = 0; i < view.count; ++i)
    {
      if (model[i].width == value.width && model[i].height == value.height)
      {
        return i;
      }
    }
    return 0;
  }

  ListView {
    id: view
    anchors.fill: parent
    anchors.margins: 5
    snapMode: ListView.SnapOneItem
    highlightFollowsCurrentItem: true
    highlight: Rectangle { color: "gray"; radius: 5 }
    currentIndex: indexForValue(listPopup.currentValue)

    delegate: Item {
      width: listPopup.itemWidth
      height: listPopup.itemHeight

      Text {
        text: modelData.width + "x" + modelData.height

        anchors.fill: parent
        anchors.margins: 5
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        elide: Text.ElideRight
        color: "white"
        font.bold: true
        style: Text.Raised
        styleColor: "black"
        font.pixelSize: 14
      }
      MouseArea {
        anchors.fill: parent
        onClicked: {
          view.currentIndex = index
          listPopup.currentValue = Qt.size(modelData.width, modelData.height)
          listPopup.selected()
        }
      }
    }
  }
}
