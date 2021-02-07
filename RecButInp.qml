import QtQuick 2.5
import QtQuick.Window 2.2
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.1
import QtQuick.Controls 1.4

Rectangle {
    id: recButInp
    width: 75
    height: 75
    border.color: "black"
    border.width: 5
    anchors.right: recDigIn.right
    anchors.rightMargin: 50
    anchors.top: recDigIn.top
    anchors.topMargin: 30

    Image {
        id: imButInp
        anchors.fill: recButInp
        anchors.margins: 5
        source: "images/inBut.jpg"
    }

    Connections {
        target: input1
        onInputChanged:
        {
           if(value == 0) imButInp.source = "images/presInBut.png"
           else imButInp.source = "images/inBut.jpg"
        }
    }
}
