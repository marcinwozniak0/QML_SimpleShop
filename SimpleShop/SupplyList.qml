import QtQuick 2.0
import QtQuick.Controls 2.12

import "ShopService.js" as Service

Item {
    Button
        {
            text: "pobierz produkty"
            onClicked: {
                Service.get_products(function(response) {
                    var receivedResponse = JSON.stringify(response);
                    print(receivedResponse);
                });
            }
        }
}
