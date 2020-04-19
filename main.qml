import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12

import Satz 1.0

Window {
    id: window
    visible: true
    width: 800
    height: 600
    x: 1100
    y: 130
    title: qsTr("Eckenspiel")

    SatzModel {
        id: satzModel
    }

    Item {
        id: globalStore
        property string kapitel: ""
    }

    //visibility: Window.FullScreen
    visibility: Window.Maximized

    StackView {
        id: stackView
        anchors.fill: parent
        initialItem: "qrc:/Eingabe.qml"
    }

}
