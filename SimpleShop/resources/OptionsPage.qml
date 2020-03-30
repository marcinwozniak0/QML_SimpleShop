import QtQuick 2.0
import QtQuick.Controls 2.12

import "ShopService.js" as Service

Item {
    property var httpEndpointAddress : ''

    TextField {
        placeholderText: qsTr('Podaj adress IP')
        onEditingFinished: {
             httpEndpointAddress = this.text

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

        validator: RegExpValidator{ regExp: /^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])$/}
    }
}
