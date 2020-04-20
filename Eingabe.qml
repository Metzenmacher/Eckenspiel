import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12

import Satz 1.0

Item {
    ColumnLayout {
        anchors.fill: parent
        anchors.margins: {top:10; bottom:10; left:10; right:10}
        RowLayout {
            ColumnLayout {
                Text {
                    text: kapitelComboBox.count ? "Kapitel:" : "neues Kapitel:"
                    font.pixelSize: 20
                }

                ComboBox {
                    id: kapitelComboBox
                    editable: true
                    model: KapitelModel {id: kapitelModel}
                    onEditTextChanged: {satzModel.selectKapitel(editText);globalStore.kapitel = editText}
                    Layout.minimumWidth: 100
                    Layout.preferredWidth: 200
                    Layout.maximumWidth: 300
                    Layout.fillWidth: true
                }
            }

            ColumnLayout {
                visible: kapitelComboBox.editText != ""
                Text {
                    text: "neuer Satz:"
                    font.pixelSize: 20
                }
                Frame {
                    padding: 0
                    Layout.minimumWidth: 200
                    Layout.fillWidth: true
                    TextArea {
                        enabled: kapitelComboBox.editText != ""
                        padding: 13
                        width: parent.width
                        id: newText
                        placeholderText: "Kapitel eingeben, neuen Satz eingeben, die wichtige Stelle **mit Sternchen** markiren und ENTER drücken..."
                        wrapMode: TextEdit.Wrap
                        onTextChanged: text = satzModel.addSatz(kapitelComboBox.editText, newText.text)
                        selectByMouse: true
                    }
                }
            }
        }

        ListView {
            id: listView
            clip: true
            Layout.fillWidth: true
            Layout.fillHeight: true
            model: satzModel

            Component.onCompleted: satzModel.underlyingDataChanged.connect(function(){kapitelComboBox.currentIndex = kapitelModel.update(kapitelComboBox.editText)})

            delegate: RowLayout {
                width: parent.width


                TextEdit {
                    textFormat: TextEdit.MarkdownText
                    Layout.fillWidth: true
                    text: model.display
                    wrapMode: Text.Wrap
                    readOnly: true
                    selectByMouse: true
                    selectByKeyboard: true

                }
                ToolButton {
                    rightPadding: 20
                    background: Item{}
                    font.pixelSize: 20
                    text: "❌"
                    onClicked: satzModel.removeSatz(index)
                }
            }

            //onCountChanged: {positionViewAtEnd()}//;kapitelModel.update()

            ScrollBar.vertical: ScrollBar {
                policy: ScrollBar.AlwaysOn
            }


        }
        Button {
            text: enabled ? "los geht's mit '" + globalStore.kapitel + "' -->" : "bitte erst Kapitel auswählen"
            enabled: listView.count > 0
            Layout.fillWidth: true
            onClicked: stackView.push(spielfeld)



        }

    }
}
