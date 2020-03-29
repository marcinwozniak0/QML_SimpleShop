import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12

import "ShopService.js" as Service

ApplicationWindow {
    id: main
    visible:true
    width: 800
    height: 600
    title: qsTr("Sklep :) ")

    Component.onCompleted:
    {
        Service.get_products(function(response) {
            var responseAsString = JSON.stringify(response.products);
            for(var i=0; i<response.products.length; i++) {
                shopSupplies.addProduct(response.products[i].name,
                                        response.products[i].price,
                                        response.products[i].weight);

            }
        });

        supplyListPage.numberOfRows = shopSupplies.getSupplyListSize()
        shoppingCardPage.numberOfRows = shoppingCard.getShoppingCardSize()
    }


    header: ToolBar {
        ToolButton {
            icon.source: "images/List.png"
            width: main.width / 3
            anchors.left: parent.left
            onClicked: {
                supplyListPage.numberOfRows = shopSupplies.getSupplyListSize()
                stack.pop();
                stack.push(supplyListPage)
            }
        }

        ToolButton {
            icon.source: "images/Shop.png"
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
