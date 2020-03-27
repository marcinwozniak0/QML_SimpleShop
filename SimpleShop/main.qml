import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 1.4

import "ShopService.js" as Service

ApplicationWindow {
    visible:true
    width: 640
    height: 480
    title: qsTr("Shop")


    toolBar: ToolBar {
        RowLayout {
            anchors.fill: parent
            ToolButton {
                iconSource: "Shop.png"
                onClicked: menu.open()
            }
            ToolButton {
                iconSource: "List.png"
                onClicked: menu.open()

            }
            ToolButton {
                iconSource: "Options.png"
                onClicked: menu.open()
            }
        }
    }

    StackView {
        id: stack
        anchors.fill: parent
    }
}
