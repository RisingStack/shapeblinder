import 'package:flutter/material.dart';
import 'package:touchable/touchable.dart';

class Donut extends CustomPainter {
  final BuildContext context;
  final Function onTap;

  Donut(this.context, this.onTap);

  @override
  void paint(Canvas canvas, Size size) {
    var myCanvas = TouchyCanvas(context, canvas);

    myCanvas.drawCircle(
      Offset(
        MediaQuery.of(context).size.width / 2.5,
        MediaQuery.of(context).size.width / 2.5,
      ),
      MediaQuery.of(context).size.width / 2.75,
      Paint()
        ..color = Colors.orange
        ..strokeWidth = 50
        ..style = PaintingStyle.stroke,
      onTapDown: (tapdetail) {
        onTap();
      },
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
