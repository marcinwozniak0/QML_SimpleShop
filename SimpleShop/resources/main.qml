import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.12
 import QtQuick.Controls 2.12
import "ShopService.js" as Service
ApplicationWindow {
    id: main
   // property var toolBarVisibility: false
    visible:true
    width: 800
    height: 600
    title: qsTr("Shop")


      header: ToolBar {
        RowLayout {
            anchors.fill: parent

            ToolButton {
                icon.source: "images/List.png"
                icon.name: "dasdasds"
                onClicked: {
                    supplyListPage.numberOfRows = shopSupplies.getSupplyListSize()
                    stack.pop();
                    stack.push(supplyListPage)
                }
                Text {
                                    text: parent.text
                                    anchors.bottom: parent.bottom
                                    anchors.horizontalCenter: parent.horizontalCenter
                                }
            }

            ToolButton {
                icon.source: "images/Shop.png"
                onClicked: {
                    stack.pop();

                        Service.get_products(function(response) {
                            var responseAsString = JSON.stringify(response.products);
                            for(var i=0; i<response.products.length; i++) {
                                shopSupplies.addProduct(response.products[i].name,
                                                            response.products[i].price,
                                                            response.products[i].weight);

                            }
                        });
                       // toolBarVisibility = true
                        supplyListPage.numberOfRows = shopSupplies.getSupplyListSize()
                     //   stack.push(supplyListPage)

                    shoppingCardPage.numberOfRows = shoppingCard.getShoppingCardSize()
                    stack.push(shoppingCardPage);
                }
            }

            ToolButton {
                icon.source: "images/Options.png"
                onClicked:{
                    stack.pop();
                    stack.push(options)
                }
            }
        }
    }

    StackView {
        id: stack
        initialItem: options
        anchors.fill: parent
    }

//    WelcomePage{
//        id: welcomePage
//    }

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

    ListModel {
           id: productsListModel
    }


}
