import QtQuick 2.7
import QtQuick.Dialogs 1.2

MessageDialog {
    id: errorDlg

    title: "Missing configuration"
    text: "The application's configuration file was not provided. The application will quit."

    icon: StandardIcon.Critical
    modality: "ApplicationModal"

    Component.onCompleted: visible = true
    onAccepted: Qt.quit()
}
