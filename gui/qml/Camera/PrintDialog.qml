import QtQuick 2.7
import QtQuick.Dialogs 1.2

MessageDialog {
  title: "Impression des photos"
  text: "Voulez-vous imprimer les photos ?"
  standardButtons: StandardButton.Yes | StandardButton.No
  modality: "ApplicationModal"
}
