import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.3
import QtQuick.Dialogs 1.2

import "ShopService.js" as Service

Item {
    property var numberOfRows: 0
    property var numberOfColumns: 5



    ScrollView{
        width: main.width
        height: main.height
        clip: true

    GridLayout {
        id: grid
        anchors.fill: parent
        columns: numberOfColumns
        rows: numberOfRows + 1
        rowSpacing: 5
        columnSpacing: 5
        anchors.margins: 5

        Repeater {
            property var shoppingCardBookmark: [ "Towar", "Ilość", "Cena za sztukę", "Cena za wszystkie\nprodukty", "Usuń produkt" ]
            model: shoppingCardBookmark
            Rectangle {
                color: "aquamarine"
                Layout.row: 0
                Layout.column: index
                Layout.preferredWidth: main.width / numberOfColumns
                Layout.preferredHeight: 70
                radius: 10
                Text {
                    text: modelData;
                    anchors.centerIn: parent
                    font.bold: true
                }
            }
        }

        Repeater {
            model: numberOfRows
            Rectangle{
                color: "cadetblue"
                Layout.row: index + 1
                Layout.column: 0
                Layout.preferredWidth: main.width / numberOfColumns
                Layout.preferredHeight: 70
                radius: 10
                Text {
                    text: qsTr(shoppingCard.getProductName(index));
                    anchors.centerIn: parent
                }}
        }

        Repeater {
            model: numberOfRows
            Rectangle{
                color: "cadetblue"
                Layout.row: index + 1
                Layout.column: 1
                Layout.preferredWidth: main.width / numberOfColumns
                Layout.preferredHeight: 70
                radius: 10
                Text {
                    text: shoppingCard.getProductAmount(index) + (numberOfRows - numberOfRows);
                    anchors.centerIn: parent
                }}
        }

        Repeater {
            model: numberOfRows
            Rectangle{
                color: "cadetblue"
                Layout.row: index + 1
                Layout.column: 2
                Layout.preferredWidth: main.width / numberOfColumns
                Layout.preferredHeight: 70
                radius: 10
                Text {
                    text: shoppingCard.getProductPrice(index);
                    anchors.centerIn: parent
                }}
        }

        Repeater {
            model: numberOfRows
            Rectangle{
                color: "cadetblue"
                Layout.row: index + 1
                Layout.column: 3
                Layout.preferredWidth: main.width / numberOfColumns
                Layout.preferredHeight: 70
                radius: 10
                Text {
                    text: shoppingCard.getProductAmount(index) * shoppingCard.getProductPrice(index)
                    anchors.centerIn: parent
                }}
        }

        Repeater {
            model: numberOfRows
            RoundButton{
                Layout.row: index + 1
                Layout.column: 4
                Layout.preferredWidth: main.width / numberOfColumns
                Layout.preferredHeight: 70
                radius: 10
                Text {
                    text: qsTr("Usuń")
                    anchors.centerIn: parent
                }
                onClicked: {
                    shoppingCard.removeProduct(index)
                    numberOfRows = shoppingCard.getShoppingCardSize();
                }}
        }

        RoundButton{

            Layout.preferredWidth: main.width
            Layout.row: grid.rows
            Layout.column: 0
            Layout.columnSpan: 5
            Layout.preferredHeight: 100
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
                    numberOfRows = shoppingCard.getShoppingCardSize();

                    finishedOrded.open()
                }
                else{
                    emptyShoppingCard.open();
                }
            }
        }

        MessageDialog {
            property var finalPrice : 0
            id: finishedOrded
            text: 'Gratulacje, zakupiłeś towar. Finalna kwota to '  + finalPrice
        }

        MessageDialog {
            property var finalPrice : 0
            id: emptyShoppingCard
            text: qsTr('Kosz jest pusty, nie możesz dokonać zakupu')
        }
    }

}
}
