import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12

import "ShopService.js" as Service

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

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
