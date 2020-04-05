import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12

Window {
    id: window
    visible: true
    width: 800
    height: 600
    x: 1200
    y: 130
    title: qsTr("Eckenspiel")

    //visibility: Window.FullScreen
    visibility: Window.Maximized




    Rectangle {
        id: ecke1
        anchors.top: parent.top
        anchors.left: parent.left
        width: parent.width / 3
        height: parent.height / 2.5
        color: "#afa"
    }

    Pfeil {
        from: ecke1
        to: ecke2
    }

    Rectangle {
        id: ecke2
        anchors.top: parent.top
        anchors.right: parent.right
        width: parent.width / 3
        height: parent.height / 2.5
        color: "#ff8"
    }

    Pfeil {
        from: ecke2
        to: ecke3
    }

    Rectangle {
        id: ecke3
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        width: parent.width / 3
        height: parent.height / 2.5
        color: "#fa6"
    }

    Pfeil {
        from: ecke3
        to: ecke4
    }

    Rectangle {
        id: ecke4
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        width: parent.width / 3
        height: parent.height / 2.5
        color: "#f88"
    }

    Pfeil {
        from: ecke4
        to: bene
    }

    Rectangle {
        id: bene
        color: "#0f0"
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: ecke4.horizontalCenter
        width: parent.width / 10
        height: parent.height / 14
        Text {
            anchors.fill: parent
            text: "BENE!"
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: height / 2
        }
    }


    MouseArea {
        anchors.fill: parent
        onPressed: forceActiveFocus()
    }


    TextArea
    {
        color: "black"
        width: parent.width / 4
        height: parent.height / 5
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.verticalCenter
        anchors.topMargin: 40
        x: 0
        y: 0

        background: Rectangle {color: "#eee"}
        font.pixelSize: 20

        selectByMouse: true
        wrapMode: TextArea.Wrap
        text: "Willkommen zu einer neuen Runde Eckenspiel!"
        horizontalAlignment: Text.AlignHCenter

    }



    Schueler{}
    Schueler{}
    Schueler{}
    Schueler{}
    Schueler{}
    Schueler{}
    Schueler{}
    Schueler{}
    Schueler{}
    Schueler{}

    Schueler{}
    Schueler{}
    Schueler{}
    Schueler{}
    Schueler{}
    Schueler{}
    Schueler{}
    Schueler{}
    Schueler{}
    Schueler{}

    Schueler{}
    Schueler{}
    Schueler{}
    Schueler{}
    Schueler{}
    Schueler{}
    Schueler{}
    Schueler{}
    Schueler{}
    Schueler{}

    Schueler{}
    Schueler{}
    Schueler{}
    Schueler{}
    Schueler{}
    Schueler{}
    Schueler{}
    Schueler{}
    Schueler{}
    Schueler{}

}
