import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CurveBackground extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Colors.blueAccent;
    paint.style = PaintingStyle.fill;

    var path = Path();

    path.moveTo(0, size.height * 0.800);
    path.quadraticBezierTo(
        size.width / 5, size.height / 4, size.width, size.height / 0.850);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
