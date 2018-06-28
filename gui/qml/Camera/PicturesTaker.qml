import QtQuick 2.0
import QtMultimedia 5.8
import QtQuick.Layouts 1.3

import "../MenuNames.js" as MenuNames

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
      picsProcessor.reset(viewfinder.resolution.height, viewfinder.resolution.width, appConfig.scaleFactor, appConfig.rotationAngle, appConfig.bottomMarginRatio)
    }
  }

  Timer {
    id: timer

    property int countDownStart : 3
    property int currentTime : countDownStart
    property int nbOfCaptures : camera.nbPreviews
    property int currentNbOfCaptures : nbOfCaptures

    interval: 1000
    running: currentNbOfCaptures >= 0
    repeat: true

    onTriggered: {
      countDownText.text = (currentTime--).toString()

      if(currentNbOfCaptures > 0)
      {
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
      else
      {
        timer.stop()
        // it is important to save at this point
        // if we do it right after the last capture,
        // the last preview takes about 6 seconds to appear...
        picsProcessor.save()
        printerMgr.printerSet ? printDlg.visible = true : handle(MenuNames.START)
      }
    }
  }

  PrintDialog {
    id: printDlg
    visible: false
    onYes: handle(MenuNames.PRINT)
    onNo: handle(MenuNames.SAVE_ONLY)
  }

  Text {
    id: countDownText
    anchors.centerIn: parent
    z: 10
    font.pixelSize: 500
    color: Qt.rgba(0.78, 0.48, 0.58, 1)
    style: Text.Outline
    styleColor: "black"
  }

  VideoOutput {
    id: videoOutput

    anchors.fill: parent

    source: camera

    fillMode: VideoOutput.PreserveAspectCrop
    autoOrientation: true
    visible: camera.imageCapture.ready
    rotation: Qt.platform.os === "ios" && camera.position === Camera.FrontFace ? 180 : 0 // this is due to a bug in Qt
  }

  CameraNotAvailable {
    anchors.fill: parent
    visible: !camera.imageCapture.ready
  }

  RowLayout {
    id: row

    anchors {
      horizontalCenter: cameraUI.horizontalCenter
      top: cameraUI.top
      topMargin: 50
    }

    spacing: 25

    Repeater {
      id: imagePreviews
      model: camera.nbPreviews
      ImagePreview {
        height: mainWindow.height / 6
        width: height / Math.sqrt(2)
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
