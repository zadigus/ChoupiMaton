import QtQuick 2.0
import QtMultimedia 5.4

Rectangle {
    id : cameraUI

    signal handle(string name)

    anchors.fill: parent

    color: "black"
    state: "PhotoCapture"

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
    }

    PhotoPreview {
        id : photoPreview
        anchors.fill : parent
        onClosed: cameraUI.state = "PhotoCapture"
        focus: visible
    }

    VideoOutput {
        id: viewfinder

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
        onPreviewSelected: cameraUI.state = "PhotoPreview"
    }

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
                target: viewfinder
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
                target: viewfinder
                visible: false
            }
            PropertyChanges {
                target: stillControls
                visible: false
            }
        }
    ]
}
