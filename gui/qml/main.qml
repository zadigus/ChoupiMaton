import QtQuick 2.0
import QtMultimedia 5.4

Rectangle {
    id : cameraUI

    width: 800
    height: 480

    color: "black"
    state: "PhotoCapture"

    states: [
        State {
            name: "PhotoCapture"
            StateChangeScript {
                script: {
                    camera.captureMode = Camera.CaptureStillImage
                    camera.start()
                }
            }
            PropertyChanges {
                target: photoPreview
                visible: false
            }
            PropertyChanges {
                target: viewFinder
                visible: true
            }
            PropertyChanges {
                target: stillControls
                visible: true
            }
        },
        State {
            name: "PhotoPreview"
            PropertyChanges {
                target: photoPreview
                visible: true
            }
            PropertyChanges {
                target: viewFinder
                visible: false
            }
            PropertyChanges {
                target: stillControls
                visible: false
            }
        }
    ]

    Camera {
        id: camera
        captureMode: Camera.CaptureStillImage

        imageCapture {
            onImageCaptured: {
                photoPreview.source = preview
                stillControls.previewAvailable = true
                cameraUI.state = "PhotoPreview"
            }
        }

        // TODO: really necessary?
        videoRecorder {
             resolution: "640x480"
             frameRate: 30
        }
    }

    PhotoPreview {
        id : photoPreview
        anchors.fill : parent
        onClosed: cameraUI.state = "PhotoCapture"
        visible: false //cameraUI.state == "PhotoPreview"
        focus: visible
    }

    VideoOutput {
        id: viewfinder
        visible: false //cameraUI.state == "PhotoCapture"

        x: 0
        y: 0
        width: parent.width - stillControls.buttonsPanelWidth
        height: parent.height

        source: camera
        autoOrientation: true
    }

    PhotoCaptureControls {
        id: stillControls
        anchors.fill: parent
        camera: camera
        visible: false //cameraUI.state == "PhotoCapture"
        onPreviewSelected: cameraUI.state = "PhotoPreview"
    }
}
