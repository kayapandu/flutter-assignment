import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CurveBackground extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Colors.blueAccent;
    paint.style = PaintingStyle.fill;

    var path = Path();

    path.moveTo(0, size.height * 0.550);
    path.quadraticBezierTo(
        size.width / 10, size.height / 10, size.width, size.height / 0.980);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
