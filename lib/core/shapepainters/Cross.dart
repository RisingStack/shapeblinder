import 'package:flutter/material.dart';
import 'package:touchable/touchable.dart';

class Cross extends CustomPainter {
  final BuildContext context;
  final Function onTap;

  Cross(this.context, this.onTap);

  @override
  void paint(Canvas canvas, Size size) {
    var myCanvas = TouchyCanvas(context, canvas);

    myCanvas.drawLine(
      Offset(
        0,
        MediaQuery.of(context).size.width / 1.25,
      ),
      Offset(
        MediaQuery.of(context).size.width / 1.25,
        0,
      ),
      Paint()
        ..color = Colors.transparent
        ..strokeWidth = 75,
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
