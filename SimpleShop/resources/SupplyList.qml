import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQuick.Dialogs 1.2

Item {

    property var supplyListSize: 0

    MessageDialog {
        id: messageDialog
        text: "Towar dodany"
    }

    GridView {
        id: grid
        property int columns : 1
        property int rows : supplyListSize
        anchors.fill: parent
        cellWidth: main.width/columns
        cellHeight: main.height/rows
        model:supplyListSize
        delegate: Rectangle{
            color: "green"
            width: main.width/2
            height: main.height/supplyListSize
            border.width: 1
            Text { text:  "Nazwa: " + shopSupplies.getProductName(index) + '\n'
                          + "Cena: " + shopSupplies.getProductPrice(index) + '\n'
                          + "Waga: " + shopSupplies.getProductWeight(index);
                anchors.centerIn: parent}
            Button{
                x: main.width/2
                width: main.width/2
                height:main.height/supplyListSize
                text: qsTr("Kliknij aby dodac do koszyka")
                onClicked: {
                    shoppingCard.addProduct(shopSupplies.getProductName(index), shopSupplies.getProductPrice(index));
                    messageDialog.open()
                }
                background: Rectangle {
                    border.color: "black"
                    color: "#948989"
                    border.width: 2
                }
            }
        }
    }
}

