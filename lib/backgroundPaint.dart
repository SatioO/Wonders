import 'package:flutter/material.dart';

class BackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint();

    Path background = new Path();
    background.addRect(Rect.fromLTRB(0, 0, size.width, size.height));
    paint.color = Colors.blue.shade700;
    canvas.drawPath(background, paint);

    Path oval = new Path();
    oval.moveTo(0, size.height * 0.20);
    oval.quadraticBezierTo(size.width * 0.55, size.height * 0.2,
        size.width * 0.6, size.height * 0.5);
    oval.quadraticBezierTo(
        size.width * 0.60, size.height * 0.75, size.width * 0.1, size.height);
    oval.lineTo(0, size.height);
    paint.color = Colors.blue.shade500;
    canvas.drawPath(oval, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}
