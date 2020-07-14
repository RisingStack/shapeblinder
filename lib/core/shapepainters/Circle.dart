import 'package:flutter/material.dart';
import 'package:touchable/touchable.dart';

class Circle extends CustomPainter {
  final BuildContext context;
  final Function onTap;

  Circle(this.context, this.onTap);

  @override
  void paint(Canvas canvas, Size size) {
    var myCanvas = TouchyCanvas(context, canvas);

    myCanvas.drawCircle(
      Offset(
        MediaQuery.of(context).size.width / 2.5,
        MediaQuery.of(context).size.width / 2.5,
      ),
      MediaQuery.of(context).size.width / 2.25,
      Paint()..color = Colors.transparent,
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
