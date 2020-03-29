import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.3
import QtQuick.Dialogs 1.2

import "ShopService.js" as Service

Item {
    property var shoppingCardSize : 0




    GridLayout {
        id: grid
        anchors.fill: parent
        columns: titles.length
        rowSpacing: 5
        columnSpacing: 5
        anchors.margins: 5

        property var titles: [ "Twar", "Ilosc", "Cena index", "Cena ALL", "Kliknij aby usunac" ]

        Repeater {
            model: grid.titles
            Label {
                Layout.row: 0
                Layout.column: index
                Layout.fillWidth: true
                Layout.fillHeight: true
                text: modelData
            }
        }

        Repeater {
            model: shoppingCardSize
            Label {
                Layout.row: index + 1
                Layout.column: 0
                Layout.fillWidth: true
                Layout.fillHeight: true
                text: shoppingCard.getProductName(index)
            }
        }

        Repeater {
            id: ilosc

            model: shoppingCardSize
            TextArea {
                Layout.row: index + 1
                Layout.column: 1
                Layout.fillWidth: true
                Layout.fillHeight: true
                text: shoppingCard.getProductAmount(index) + (shoppingCardSize - shoppingCardSize)
            }
        }

        Repeater {
            model: shoppingCardSize
            TextArea {
                Layout.row: index + 1
                Layout.column: 2
                Layout.fillWidth: true
                Layout.fillHeight: true
                text: shoppingCard.getProductPrice(index)
            }
        }

        Repeater {
            model: shoppingCardSize
            TextArea {
                Layout.row: index + 1
                Layout.column: 3
                Layout.fillWidth: true
                Layout.fillHeight: true
                text: shoppingCard.getProductAmount(index) * shoppingCard.getProductPrice(index)
            }
        }

        Repeater {
            model: shoppingCardSize
            Button {
                Layout.row: index + 1
                Layout.column: 4
                Layout.fillWidth: true
                Layout.fillHeight: true
                text: qsTr("Usun jeden element")
                onClicked: {
                    shoppingCard.removeProduct(index)
                    stack.pop();
                    stack.push(shoppingCardPage);
                    shoppingCardSize = shoppingCard.getShoppingCardSize();
                }
            }
        }

        Button{
            Layout.columnSpan: 2
            text: qsTr("KUP")
            onClicked:
            {
                if (0 !== shoppingCard.getShoppingCardSize()){
                    var rquest = {
                        price: shoppingCard.getTotalPrice().toString()
                    }

                    Service.send_total_price(rquest, function(resp){
                        finishedOrded.finalPrice = JSON.stringify(resp)})

                    shoppingCard.clearShoppingCard();
                    shoppingCardSize = shoppingCard.getShoppingCardSize();

                    finishedOrded.open()
                }
            }
        }
        MessageDialog {
            property var finalPrice : 0
            id: finishedOrded
            text: 'Gratulacje, zakupiles towar. Finalna kwota to '  + finalPrice
        }
    }

}
