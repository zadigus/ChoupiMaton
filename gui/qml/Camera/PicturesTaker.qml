import QtQuick 2.0
import QtMultimedia 5.8
import QtQuick.Layouts 1.3

Rectangle {
  id : cameraUI

  signal handle(string name)

  anchors.fill: parent

  Camera {
    id: camera

    property int nbPreviews : 4
    property int currentPreview: 0

    captureMode: Camera.CaptureStillImage

    // TODO: make the following parameters configurable
    position: Camera.FrontFace
    viewfinder.resolution: "1920x1080"
    imageProcessing.whiteBalanceMode: CameraImageProcessing.WhiteBalanceManual
    imageProcessing.manualWhiteBalance: 7000

    imageCapture {
      id: imgCapture

      onImageCaptured: {
        var imgPrev = imagePreviews.itemAt(currentPreview++)
        if(imgPrev != null)
        {
          imgPrev.source = preview
        }
      }
    }
  }

  VideoOutput {
    id: videoOutput

    anchors.fill: parent

    source: camera

    fillMode: VideoOutput.PreserveAspectCrop
    autoOrientation: true
    visible: camera.imageCapture.ready

    MouseArea {
      anchors.fill: parent
      onClicked: {
        if(camera.imageCapture.ready)
        {
          camera.imageCapture.capture()
        }
      }
    }
  }

  CameraNotAvailable {
    anchors.fill: parent
    visible: !camera.imageCapture.ready
  }

  RowLayout {
    id: row

    anchors {
      horizontalCenter: cameraUI.horizontalCenter
      bottom: cameraUI.bottom
      bottomMargin: 50
    }

    spacing: 25

    Repeater {
      id: imagePreviews
      model: camera.nbPreviews
      ImagePreview {
        height: mainWindow.height / 6
        width: height / Math.sqrt(2)

        MouseArea {
          anchors.fill: parent
          onClicked: handle("start")
        }
      }
    }
  }
}
