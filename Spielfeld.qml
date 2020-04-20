import QtQuick 2.12
import QtQuick.Controls 2.12

import Satz 1.0

Item {
    Rectangle {
        id: ecke1a
        width: 210
        anchors.top: parent.top
        anchors.right: parent.right
        height: parent.height / 10
        color: "#afa"
    }
    Pfeil {
        from: ecke1a
        to: ecke1b
    }
    Rectangle {
        id: ecke1b
        width: 210
        anchors.top: parent.top
        anchors.right: ecke1a.left
        anchors.rightMargin: 40
        height: parent.height / 10
        color: "#afa"
    }

    Pfeil {
        from: ecke1b
        to: ecke2a
    }

    Rectangle {
        id: ecke2a
        width: 210
        anchors.top: parent.top
        anchors.left: ecke2b.right
        anchors.leftMargin: 40
        height: parent.height / 10
        color: "#ff8"
    }
    Pfeil {
        from: ecke2a
        to: ecke2b
    }
    Rectangle {
        id: ecke2b
        width: 210
        anchors.top: parent.top
        anchors.left: parent.left
        height: parent.height / 10
        color: "#ff8"
    }

    Pfeil {
        from: ecke2b
        to: ecke3a
    }

    Rectangle {
        id: ecke3a
        width: 210
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        height: parent.height / 10
        color: "#fa6"
    }
    Pfeil {
        from: ecke3a
        to: ecke3b
    }
    Rectangle {
        id: ecke3b
        width: 210
        anchors.bottom: parent.bottom
        anchors.left: ecke3a.right
        anchors.leftMargin: 40
        height: parent.height / 10
        color: "#fa6"
    }

    Pfeil {
        from: ecke3b
        to: pult
    }

    Rectangle {
        id: pult
        color: "#f44"
        width: 210
        anchors.verticalCenter: ecke3b.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        height: parent.height / 10
        Text {
            anchors.fill: parent
            text: "BENE?"
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: height / 3
        }
    }


    MouseArea {
        anchors.fill: parent
        onPressed: forceActiveFocus()
    }

    SwipeView
    {
        id: view
        width: parent.width / 2
        height: parent.height / 5
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.verticalCenter
        anchors.topMargin: 40
        background: Rectangle {color: "#eee"}

        currentIndex: pageIndicator.currentIndex

        clip: true
        Repeater {
            model: satzModel

            delegate: Text {
                color: "black"
                textFormat: Text.MarkdownText

                font.pixelSize: 30

                wrapMode: Text.Wrap
                text: model.display
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter

            }
        }

    }
    PageIndicator {
        id: pageIndicator
        interactive: true
        count: view.count
        currentIndex: view.currentIndex
        anchors.top: view.bottom
        anchors.horizontalCenter: view.horizontalCenter

    }


//    TextArea
//    {
//        color: "black"
//        width: parent.width / 4
//        height: parent.height / 5
//        anchors.horizontalCenter: parent.horizontalCenter
//        anchors.top: parent.verticalCenter
//        anchors.topMargin: 40
//        textFormat: TextEdit.MarkdownText

//        background: Rectangle {color: "#eee"}
//        font.pixelSize: 20

//        selectByMouse: true
//        wrapMode: TextArea.Wrap
//        text: "Willkommen zu einer neuen Runde Eckenspiel!"
//        horizontalAlignment: Text.AlignHCenter

//    }



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


    Button {
        text: "<-- zurück"
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        onClicked: stackView.pop()
    }

}
