import QtQuick 2.0
import QtQuick.Controls 2.12

import "ShopService.js" as Service

Item {

    Button{
        text: "Witamy w sklepie \n Kliknij aby rozpoaczac"
        anchors.centerIn: parent
        onClicked: {
            Service.get_products(function(response) {
                var responseAsString = JSON.stringify(response.products);
                for(var i=0; i<response.products.length; i++) {
                    shopSupplies.addProduct(response.products[i].name,
                                                response.products[i].price,
                                                response.products[i].weight);

                }
            });
            toolBarVisibility = true
            supplyList.supplyListSize = shopSupplies.getSupplyListSize()
            stack.push(supplyList)
        }

        background: Rectangle {
                implicitWidth: 200
                implicitHeight: 100
                opacity: enabled ? 1 : 0.3
                border.color: "black"
                border.width: 2
                radius: 20
            }
    }
}
