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
                iconSource: "images/List.png"
                onClicked: {
                    supplyList.supplyListSize = shopControler.getSupplyListSize()
                    stack.pop();
                    stack.push(supplyList)
                    Service.get_products(function(response) {
                        var responseAsString = JSON.stringify(response.products);
                        for(var i=0; i<response.products.length; i++) {
                            shopControler.readInputData(response.products[i].name,
                                                        response.products[i].price,
                                                        response.products[i].weight);

                        }
                    });

                }
            }

            ToolButton {
                iconSource: "images/Shop.png"
                onClicked: {
                    onClicked
                    stack.pop();
                    stack.push(shoppingCardPage);
                }
            }

            ToolButton {
                iconSource: "images/Options.png"
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

        supplyListSize: shopControler.getSupplyListSize()
        id: supplyList
        visible: false
    }

    ShoppingCard{
        shoppingCardSize: shoppingCard.shopingCardSize
        id: shoppingCardPage
        visible: false
    }

    Options{
        id: options
        visible: false
    }

    ListModel {
           id: productsListModel
    }

//    ShopingCardClass{
//        property var shopingCardSize : getListSize()
//        property  var dupa: dupa()
//        //property var productsInShoppingCart : productsList
//        id: shoppingCard
//        onProductsChanged: {
//            print('UPDATED');
//            shopingCardSize = getListSize()
//        }
//    }

}
