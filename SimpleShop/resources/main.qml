import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 1.4

ApplicationWindow {
    id: main
    property var toolBarVisibility: false
    visible:true
    width: 800
    height: 600
    title: qsTr("Shop")

    toolBar: ToolBar {
        visible: toolBarVisibility
        RowLayout {
            anchors.fill: parent

            ToolButton {
                iconSource: "images/List.png"
                onClicked: {
                    supplyList.supplyListSize = shopControler.getSupplyListSize()
                    stack.pop();
                    stack.push(supplyList)
                }
                Text {
                                    text: parent.text
                                    anchors.bottom: parent.bottom
                                    anchors.horizontalCenter: parent.horizontalCenter
                                }
            }

            ToolButton {
                iconSource: "images/Shop.png"
                onClicked: {
                    stack.pop();
                    shoppingCardPage.shoppingCardSize = shoppingCard.getShoppingCardSize()
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
        initialItem: welcomePage
        anchors.fill: parent
    }

    WelcomePage{
        id: welcomePage
    }

    SupplyList{

        supplyListSize: shopControler.getSupplyListSize()
        id: supplyList
        visible: false
    }

    ShoppingCard{
        shoppingCardSize: shoppingCard.getShoppingCardSize()
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


}
