import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: Scaffold(body: Center(child: CustomPaint(size: const Size(300, 300), painter: P())))));

class P extends CustomPainter {
  @override void paint(Canvas c, Size s) {
    var p = Paint()..style = PaintingStyle.stroke..strokeWidth = 3;
    c.drawLine(const Offset(20, 20), const Offset(200, 20), p..color = Colors.red);
    c.drawRect(const Rect.fromLTWH(20, 50, 180, 100), p..color = Colors.blue);
    c.drawCircle(const Offset(110, 220), 50, p..color = Colors.green);
  }
  @override bool shouldRepaint(P o) => false;
}