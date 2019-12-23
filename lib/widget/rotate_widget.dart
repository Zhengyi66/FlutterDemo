import 'package:flutter/material.dart';
import 'dart:math';

class RotateWidget extends StatelessWidget {
  final double width;
  final double height;

  ///颜色渐变
  final List<Color> colors;

  RotateWidget(
      {this.width = 100,
      this.height = 100,
      this.colors,});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _customPainter(width, height, this.colors),
      size: Size(width, height),
    );
  }
}

class _customPainter extends CustomPainter {
  final double width;
  final double height;
  ///颜色渐变
  final List<Color> colors;
  ///1角度 =  radians弧度
  double radians = pi / 180;

  _customPainter(
    this.width,
    this.height,
    this.colors,
  );

  @override
  void paint(Canvas canvas, Size size) {
    ///半径
    double r = width / 2;
    Rect rect = Rect.fromLTWH(0, 0, width, height);

    var progressPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..color = Colors.white
      ..strokeWidth = 10;

    if (colors != null && colors.length > 0) {
      progressPaint.shader = SweepGradient(
        colors: colors,
      ).createShader(rect);
    }

    var paint = Paint()..color = Colors.white..style = PaintingStyle.fill;
    canvas.drawRect(rect, paint);

    canvas.drawCircle(Offset(r,r), 2, progressPaint);
    ///将rectProgress圆心指向中间点
    var rectProgress = Rect.fromLTRB(-r, -r, r, r);
    canvas.translate(r, r);
    canvas.rotate(radians * 45);
    canvas.drawRect(rectProgress, progressPaint);

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
