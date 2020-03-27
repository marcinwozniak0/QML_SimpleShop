import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQuick.Dialogs 1.2

Item {
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
            model: productsList

            Rectangle{
                width: 100
                height: 60
                border.width: 1
                Text { text:  "Nazwa: " + productsList.get(index).name + '\n'
                              + "Cena: " + productsList.get(index).price + '\n'
                              + "Waga: " +productsList.get(index).weight}
                Button{
                    x: 100
                    Text {text: "KUP"}
                    onClicked: {
                        card.addElement(productsList.get(index).name, productsList.get(index).price);
                        messageDialog.open()

                    }
                }
            }
        }
    }
}


