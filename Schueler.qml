import QtQuick 2.12
import QtQuick.Controls 2.12

Rectangle {
    anchors.horizontalCenter: parent.horizontalCenter
    anchors.verticalCenter: parent.verticalCenter


    implicitWidth: Math.max(dragButton.width + nameTag.implicitWidth + 30, 150)
    implicitHeight: nameTag.implicitHeight + 8
    color: "blue"
    radius: 10
    property alias text: nameTag.text

    Rectangle {
        id: dragButton
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.margins: 10

        width: height
        radius: height / 4

        color: "red"

        MouseArea {
            id: mouseArea
            anchors.fill: parent
            drag.target: parent.parent
            drag.threshold: 0
            drag.minimumX: 0
            drag.maximumX: parent.parent.parent.width -parent.parent.width
            drag.minimumY: 0
            drag.maximumY: parent.parent.parent.height -parent.parent.height
            drag.onActiveChanged: {
                if (drag.active) {
                    parent.parent.anchors.left = undefined;
                    parent.parent.anchors.right = undefined;
                    parent.parent.anchors.top = undefined;
                    parent.parent.anchors.bottom = undefined;
                    parent.parent.anchors.verticalCenter = undefined;
                    parent.parent.anchors.horizontalCenter = undefined;
                }
                else
                {
                    if(parent.parent.x >= drag.maximumX) parent.parent.anchors.right = parent.parent.parent.right;
                    if(parent.parent.y >= drag.maximumY) parent.parent.anchors.bottom = parent.parent.parent.bottom;
                }
            }
            onPressed: forceActiveFocus();

        }

        Text
        {
            anchors.fill: parent
            anchors.margins: 0
            text: "✥"
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: height
            font.bold: mouseArea.pressed
            color: "black"
        }
    }


    TextField {
        id: nameTag
        anchors.top: parent.top
        anchors.left: dragButton.right
        anchors.leftMargin: 8
        anchors.topMargin: 4

        implicitWidth: Math.max(contentWidth + 4, 120)
        implicitHeight: font.pixelSize * 1.4
        background.opacity: 0 // activeFocus * 0.2
        padding: 0
        font.pixelSize: 25
        font.bold: true
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        placeholderText: "Name"
        placeholderTextColor: "gray"
        color: "white"

        onEditingFinished: parent.forceActiveFocus()
        Keys.onEscapePressed: parent.forceActiveFocus()
    }

}
