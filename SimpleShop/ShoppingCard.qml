import QtQuick 2.0
import QtQuick.Controls 2.12

Item {
    Rectangle{
        width: 180
        height: 60
        border.width: 1
        Text {text: 'Total number of items : ' + card.getListSize()}
    }
}
