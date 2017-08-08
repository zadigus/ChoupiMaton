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

  Timer {
    property int countDownStart : 3
    property int currentTime : countDownStart
    property int nbOfCaptures : camera.nbPreviews

    interval: 1000
    running: nbOfCaptures > 0
    repeat: true

    onTriggered: {
      countDownText.text = (currentTime--).toString()

      if(currentTime < 0)
      {
        if(camera.imageCapture.ready)
        {
          camera.imageCapture.capture()
        }
        currentTime = countDownStart
        --nbOfCaptures
      }
    }
  }

  Text {
    id: countDownText
    anchors.centerIn: parent
    z: 10
    font.pixelSize: 500
    color: "yellow"
  }

  VideoOutput {
    id: videoOutput

    anchors.fill: parent

    source: camera

    fillMode: VideoOutput.PreserveAspectCrop
    autoOrientation: true
    visible: camera.imageCapture.ready
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
