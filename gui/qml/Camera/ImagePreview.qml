import QtQuick 2.0

Rectangle {
  property alias source: image.source

  border {
    width: 5
    color: "black"
  }

  clip: true
  color: "transparent"

  z: 1 // if we don't use z-order, then the black border
  // doesn't appear around the pictures

  Image {
    id: image

    anchors.fill: parent

    fillMode: Image.PreserveAspectFit
    transformOrigin: Item.Center
    rotation: -90 // for some reason, the preview image provided by the camera is rotated by 90°
    scale: 2 // this scaling ratio seems to work for every tested resolution, i.e. every resolution
    // supported by the iPad pro 12.9''

    z: -1 // see comment on parent's z
  }
}
