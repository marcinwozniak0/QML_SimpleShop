import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 1.4

ApplicationWindow {
    visible:true
    width: 640
    height: 480
    title: qsTr("Shop")

    toolBar: ToolBar {
        RowLayout {
            anchors.fill: parent

            ToolButton {
                iconSource: "List.png"
                onClicked: {
                    stack.pop();
                    stack.push(supplyList)
                    print(stack.depth)
                }
            }

            ToolButton {
                iconSource: "Shop.png"
                onClicked: {
                    stack.pop();
                    stack.push(shoppingCard);
                    print(stack.depth)
                }
            }

            ToolButton {
                iconSource: "Options.png"
                onClicked:{
                    stack.pop();
                    stack.push(options)
                    print(stack.depth)
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
}
