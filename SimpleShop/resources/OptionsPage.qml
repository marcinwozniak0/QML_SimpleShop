import QtQuick 2.0
import QtQuick.Controls 2.12

Item {
    property var httpEndpointAddress : '127.0.0.1'

    TextField {
        placeholderText: qsTr('127.0.0.1')
        onTextChanged: {
            httpEndpointAddress = this.text
        }

        validator: RegExpValidator{ regExp: /^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])$/}
    }
}
