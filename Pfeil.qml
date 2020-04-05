import QtQuick 2.12
import QtQuick.Shapes 1.12

Item {
    property QtObject from
    property QtObject to
    property real size: 10


    readonly property bool isLeftToRight: from.x + from.width < to.x
    readonly property bool isRightToLeft: to.x + to.width < from.x

    readonly property bool isTopToBottom: from.y + from.height < to.y
    readonly property bool isBottomToTop: to.y + to.height < from.y

    readonly property bool isHorizontal: isLeftToRight || isRightToLeft
    readonly property bool isVertical: isTopToBottom || isBottomToTop

    readonly property real len: isHorizontal ? width + 1 : height + 1

    anchors.left: isLeftToRight ? from.right : isRightToLeft ? to.right : from.left
    anchors.right: isLeftToRight ? to.left : isRightToLeft ? from.left : from.right

    anchors.top: isTopToBottom ? from.bottom : isBottomToTop ? to.bottom : from.top
    anchors.bottom: isTopToBottom ? to.top : isBottomToTop ? from.top : from.bottom

    visible: isHorizontal ? !isVertical : isVertical


    Shape {

        transform: Rotation { origin.x: 0; origin.y: 0; angle: isLeftToRight ? 0 : isRightToLeft ? 180 : isTopToBottom ? 90 : -90}

        anchors.centerIn: parent

        ShapePath {
            strokeWidth: -1
            fillGradient: LinearGradient {
                x1: -len/2; y1: 0
                x2: len/2; y2: 0
                GradientStop { position: 0; color: from.color }
                GradientStop { position: 1; color: to.color }
            }
            startX: -len/2; startY: -size
            PathLine { x: len/2-size*2; y: -size }
            PathLine { x: len/2-size*2; y: -size*2 }
            PathLine { x: len/2; y: 0 }
            PathLine { x: len/2-size*2; y: size*2 }
            PathLine { x: len/2-size*2; y: size }
            PathLine { x: -len/2; y: size }
            PathLine { x: -len/2; y: -size }
        }
    }
}
