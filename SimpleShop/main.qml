import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 1.4

import "ShopService.js" as Service

ApplicationWindow {
    visible:true
    width: 800
    height: 600
    title: qsTr("Shop")


    toolBar: ToolBar {
        RowLayout {
            anchors.fill: parent

            ToolButton {
                iconSource: "List.png"
                onClicked: {
                    stack.pop();
                    stack.push(supplyList)
                    Service.get_products(function(response) {
                        var responseAsString = JSON.stringify(response.products);
                        productsList.clear();
                        for(var i=0; i<response.products.length; i++) {
                            productsList.append(response.products[i]);
                        }
                        print(response.products[0].name);
                        print(productsList.get(0).name)
                    });
                }
            }

            ToolButton {
                iconSource: "Shop.png"
                onClicked: {
                    stack.pop();
                    stack.push(shoppingCard);
                }
            }

            ToolButton {
                iconSource: "Options.png"
                onClicked:{
                    stack.pop();
                    stack.push(options)
                }
            }
        }
    }

    StackView {
        id: stack
        initialItem: supplyList
        anchors.fill: parent
    }

    SupplyList{
        id: supplyList
        visible: false
    }

    ShoppingCard{
        id: shoppingCard
        visible: false
    }

    Options{
        id: options
        visible: false
    }

    ListModel {
           id: productsList
    }

}
