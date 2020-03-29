import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.3
import QtQuick.Controls.Styles 1.4

Item {
    property var numberOfRows: 0
    property var numberOfColumns: 3

    MessageDialog {
        id: messageDialog
        text: "Towar dodany"
    }

    ScrollView{
        width: main.width
        height: main.height
        clip: true

        GridLayout {
            id: supplyListGridLayout
            property var cellHeight: 70
            property var cellWidth: 100
            columns: 3
            rows: numberOfRows

            Repeater {
                model: numberOfRows
                Rectangle {
                    property var productArtifacts:  "Nazwa\nCena (gr)\nWaga (kg)"
                    color: "green"
                    Layout.row: index
                    Layout.column: 0
                    Layout.preferredWidth: supplyListGridLayout.cellWidth
                    Layout.preferredHeight: supplyListGridLayout.cellHeight
                    radius: 10
                    Text {
                        text: qsTr(productArtifacts);
                        anchors.centerIn: parent
                    }
                }
            }

            Repeater {
                model: numberOfRows
                Rectangle{
                    color: "green"
                    Layout.row: index
                    Layout.column: 1
                    Layout.preferredWidth: supplyListGridLayout.cellWidth
                    Layout.preferredHeight: supplyListGridLayout.cellHeight
                    radius: 10
                    Text {
                        text: qsTr(shopSupplies.getProductName(index) + '\n'
                                   + shopSupplies.getProductPrice(index) + '\n'
                                   + shopSupplies.getProductWeight(index));
                        anchors.centerIn: parent
                    }}
            }

            Repeater {
                model: numberOfRows
                RoundButton {
                    Layout.row: index
                    Layout.column: 2
                    Layout.fillWidth: true
                    Layout.preferredWidth: main.width - supplyListGridLayout.cellWidth * 2
                    Layout.preferredHeight: 70
                    text: qsTr("Kliknij, aby dodać do koszyka")
                    onClicked: {
                        shoppingCard.addProduct(shopSupplies.getProductName(index), shopSupplies.getProductPrice(index));
                        messageDialog.open()
                    }
                }
            }
        }
    }
}


