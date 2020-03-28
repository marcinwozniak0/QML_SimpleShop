import QtQuick 2.0
import QtQuick.Controls 2.12

Item {
    property var shoppingCardSize : 0
    Rectangle{
        width: 180
        height: 60
        border.width: 1
        Text {text: 'Total number of items : ' + shoppingCardSize}
    }
}
