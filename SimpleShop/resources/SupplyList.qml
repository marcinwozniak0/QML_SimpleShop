import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQuick.Dialogs 1.2

Item {

    property var supplyListSize: 0

        MessageDialog {
        id: messageDialog
        text: "Towar dodany"
    }

    Column{
        id: columnWithSupplies
        x: 100
        y: 100
        spacing: 5
        Repeater{
            model: supplyListSize

            Rectangle{
                width: 100
                height: 60
                border.width: 1
                Text { text:  "Nazwa: " + shopControler.getProductName(index) + '\n'
                              + "Cena: " + shopControler.getProductPrice(index) + '\n'
                              + "Waga: " + shopControler.getProductWeight(index)}
                Button{
                    x: 100
                    Text {text: "KUP"}
                    onClicked: {
                        shoppingCard.addElement(shopControler.getProductName(index), shopControler.getProductPrice(index));
                        messageDialog.open()

                    }
                }
            }
        }
    }
}


