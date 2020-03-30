import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Dialogs 1.2

ApplicationWindow {
    id: main
    visible:true
    width: 800
    height: 600
    title: qsTr("Sklep :) ")
    property var currentHttpStatus: 0

    MessageDialog {
        id: serverNotConnected
        text: qsTr('Nie udało się pobrać produktów z sewera. Podaj poprawny adres w zakładce OPCJE');
    }

    header: ToolBar {
        ToolButton {
            icon.source: "images/SupplyList.png"
            width: main.width / 3
            anchors.left: parent.left
            onClicked: {
                if (0 === shopSupplies.getSupplyListSize()){
                    serverNotConnected.open()
                }
                supplyListPage.numberOfRows = shopSupplies.getSupplyListSize()
                stack.pop();
                stack.push(supplyListPage)
            }
        }

        ToolButton {
            icon.source: "images/ShopingCard.png"
            width: main.width / 3
            anchors.centerIn: parent
            onClicked: {
                stack.pop();
                shoppingCardPage.numberOfRows = shoppingCard.getShoppingCardSize()
                stack.push(shoppingCardPage);
            }
        }

        ToolButton {
            width: main.width / 3
            anchors.right: parent.right
            icon.source: "images/Options.png"
            onClicked:{
                stack.pop();
            }
        }
    }

    StackView {
        id: stack
        initialItem: options
        anchors.fill: parent
    }

    SupplyList{
        id: supplyListPage
        numberOfRows: shopSupplies.getSupplyListSize()
        visible: false
    }

    ShoppingCard{
        numberOfRows: shoppingCard.getShoppingCardSize()
        id: shoppingCardPage
        visible: false
    }

    OptionsPage{
        id: options
        visible: false
    }
}
