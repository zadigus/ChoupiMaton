import QtQuick 2.0
import QtMultimedia 5.8
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3

import "../common" as Common

Rectangle {
  id : cameraUI

  signal handle(string name)

  anchors.fill: parent

  Camera {
    id: camera

    property int nbPreviews : 4
    property int currentPreview: 0

    captureMode: Camera.CaptureStillImage
    imageProcessing.whiteBalanceMode: CameraImageProcessing.WhiteBalanceManual

    imageCapture {
      id: imgCapture
    }

    Component.onCompleted: {
      resolutionList.model = supportedViewfinderResolutions()
    }
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

  Rectangle {
    id: sideBar

    color: camera.imageCapture.ready ? "black" : "transparent"

    width: cameraUI.width / 4
    height: cameraUI.height
    anchors {
      right: cameraUI.right
    }

    ColumnLayout {

      anchors.fill: parent

      Common.ParamIndicator {
        id: colorTempInd

        Layout.fillWidth: true
        Layout.alignment: Qt.AlignHCenter

        name: "Color temperature [K]"

        from: 2000
        to: 8000
        value: appConfig.colorTemp
        stepSize: 100

        onValueChanged: console.log("lock status = " + camera.lockStatus)

        Binding {
          target: appConfig
          property: "colorTemp"
          value: colorTempInd.value
        }

        Binding {
          target: camera.imageProcessing
          property: "manualWhiteBalance"
          value: colorTempInd.value
        }
      }

      Common.ParamIndicator {
        id: zoomInd

        Layout.fillWidth: true
        Layout.alignment: Qt.AlignHCenter

        name: "Zoom"

        from: 1
        to: camera.maximumDigitalZoom
        value: appConfig.zoom
        stepSize: 1

        Binding {
          target: appConfig
          property: "zoom"
          value: zoomInd.value
        }

        Binding {
          target: camera
          property: "digitalZoom"
          value: zoomInd.value
        }
      }

      CameraListButton {
        id: cameraList
        Layout.alignment: Qt.AlignHCenter
        model: QtMultimedia.availableCameras
        value: appConfig.cameraPosition

        Binding {
          target: appConfig
          property: "cameraPosition"
          value: cameraList.value
        }

        Binding {
          target: camera
          property: "position"
          value: cameraList.value
        }
      }

      ResolutionListButton {
        id: resolutionList
        Layout.alignment: Qt.AlignHCenter
        value: appConfig.resolution

        Binding {
          target: appConfig
          property: "resolution"
          value: resolutionList.value
        }

        Binding {
          target: camera.viewfinder
          property: "resolution"
          value: resolutionList.value
        }
      }

      Button {
        Layout.alignment: Qt.AlignHCenter

        text: "Close"
        onClicked: {
          handle("start")
        }
      }

    }
  }
}
