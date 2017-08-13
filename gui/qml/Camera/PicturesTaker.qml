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

    position: appConfig.cameraPosition
    viewfinder.resolution: appConfig.resolution
    imageProcessing.whiteBalanceMode: CameraImageProcessing.WhiteBalanceManual
    imageProcessing.manualWhiteBalance: appConfig.colorTemp
    digitalZoom: appConfig.zoom

    imageCapture {
      id: imgCapture

      onImageCaptured: {
        var imgPrev = imagePreviews.itemAt(currentPreview++)
        if(imgPrev != null)
        {
          imgPrev.source = preview
          picsProcessor.process(preview)
        }
      }
    }

    Component.onCompleted: {
      picsProcessor.reset(viewfinder.resolution.height, viewfinder.resolution.width)
    }
  }

  Timer {
    id: timer

    property int countDownStart : 3
    property int currentTime : countDownStart
    property int nbOfCaptures : camera.nbPreviews
    property int currentNbOfCaptures : nbOfCaptures

    interval: 1000
    running: currentNbOfCaptures > 0
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
        --currentNbOfCaptures
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

      Component.onCompleted: {
        for(var i=0; i<imagePreviews.count; ++i)
        {
          imagePreviews.itemAt(i).source = "qrc:/images/RandomPreview" + (i+1)
        }
      }
    }
  }
}
