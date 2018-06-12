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
    rotation: Qt.platform.os === "ios" && camera.position === Camera.FrontFace ? 180 : 0 // this is due to a bug in Qt
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

        Binding {
          target: camera.imageProcessing
          property: "manualWhiteBalance"
          value: colorTempInd.value
        }

        onValueChanged: displayText = Math.round(value)
      }

      Common.ParamIndicator {
        id: zoomInd

        Layout.fillWidth: true
        Layout.alignment: Qt.AlignHCenter
        snapMode: Slider.NoSnap
        name: "Zoom"

        // we map the slider interval [minVal, maxVal] to the zoom interval [minZoom, maxZoom]
        property real minVal: 0
        property real maxVal: 1
        property real minZoom: 1
        property real maxZoom: camera.maximumDigitalZoom

        // the slider value (maxVal - minVal) / 2 is mapped to the zoom value N * minZoom
        property real n: 2

        // exponential interpolation coefficients
        property real coeffA: (Math.pow(minZoom, 2) * Math.pow(n - 1, 2))/(maxZoom - minZoom * (2 * n - 1))
        property real coeffB: 2.0 / maxVal * Math.log((minZoom * (n - 1)) / coeffA + 1)
        property real coeffC: minZoom - coeffA

        from: minVal
        to: maxVal
        value: zoomInd.invZoom(appConfig.zoom)
        stepSize: 0.1

        function zoom(sliderValue)
        {
          return coeffA * Math.exp(coeffB * sliderValue) + coeffC
        }

        function invZoom(zoomValue)
        {
          return 1 / coeffB * Math.log((zoomValue - coeffC) / coeffA)
        }

        Binding {
          target: camera
          property: "digitalZoom"
          value: zoomInd.zoom(zoomInd.value)
        }

        onValueChanged: displayText = Math.round(zoomInd.zoom(value) * 100) / 100
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
          appConfig.zoom = zoomInd.zoom(zoomInd.value)
          appConfig.colorTemp = colorTempInd.value
          handle("start")
        }
      }

    }
  }
}
