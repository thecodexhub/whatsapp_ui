import 'package:flutter/material.dart';

class MyPainter extends CustomPainter {
  final Offset center;
  final double containerHeight, radius;
  final BuildContext context;

  Color color;
  double statusBarHeight, screenWidth;

  MyPainter({this.center, this.radius, this.context, this.containerHeight}) {
    color = Colors.grey[50];
    statusBarHeight = MediaQuery.of(context).padding.top;
    screenWidth = MediaQuery.of(context).size.width;
  }

  @override
  void paint(Canvas canvas, Size size) {
    Paint circlePainter = Paint();

    circlePainter.color = color;
    canvas.clipRect(Rect.fromLTWH(
        0.0, 0.0, screenWidth, containerHeight + statusBarHeight));
    canvas.drawCircle(center, radius, circlePainter);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
