import QtQuick 2.7

Canvas {
  id: canvas

  property string itemsColor: "red"
  onPaint: {
    var ctx = getContext("2d")

    ctx.save()

    ctx.lineWidth = 15
    ctx.strokeStyle = itemsColor

    var targetX = canvas.width / 2
    var targetY = 100

    // line
    ctx.beginPath()
    ctx.moveTo(865, 615)
    ctx.lineTo(755, 397)
    ctx.lineTo(768, 519)
    ctx.lineTo(targetX, targetY)
    ctx.stroke()

    // arrow head
    ctx.beginPath()
    ctx.moveTo(targetX, targetY)
    ctx.lineTo(targetX + 100, targetY)
    ctx.stroke()

    ctx.beginPath()
    ctx.moveTo(targetX, targetY)
    ctx.lineTo(457, targetY + 95)
    ctx.stroke()

    ctx.restore()
  }

  FontLoader {
    id: font
    source: "qrc:/fonts/RujisHandWriting"
  }

  Text {
    x: 763
    y: 652
    font {
      family: font.name
      bold: true
      pixelSize: 50
    }
    color: itemsColor
    text: qsTr("watch here!")
  }
}
