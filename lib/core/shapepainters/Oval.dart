import 'package:flutter/material.dart';
import 'package:touchable/touchable.dart';

class Oval extends CustomPainter {
  final BuildContext context;
  final Function onTap;

  Oval(this.context, this.onTap);

  @override
  void paint(Canvas canvas, Size size) {
    var myCanvas = TouchyCanvas(context, canvas);

    myCanvas.drawOval(
      Rect.fromLTRB(
        0,
        0,
        MediaQuery.of(context).size.width / 1.25,
        MediaQuery.of(context).size.width / 4,
      ),
      Paint()..color = Colors.orange,
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
