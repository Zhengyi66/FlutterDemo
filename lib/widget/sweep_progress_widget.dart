import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:ui' as ui;

class SweepProgressTestWidget extends StatelessWidget {
  final double width;
  final double height;

  ///进度0~100
  final int progress;

  ///颜色渐变
  final List<Color> colors;
  final String startText;
  final String endText;
  final String centerText;
  final String centerTopText;

  SweepProgressTestWidget(
      {this.width = 100,
      this.height = 100,
      this.progress = 0,
      this.colors,
      this.startText = '0',
      this.endText = '100',
      this.centerText = '',
      this.centerTopText = ''});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _customPainter(width, height, this.progress, this.colors,
          this.startText, this.endText, this.centerText, this.centerTopText),
      size: Size(width, height),
    );
  }
}

class _customPainter extends CustomPainter {
  final double width;
  final double height;
  final int progress;
  final String startText;
  final String endText;
  final String centerText;
  final String centerTopText;

  ///颜色渐变
  final List<Color> colors;

  _customPainter(
    this.width,
    this.height,
    this.progress,
    this.colors,
    this.startText,
    this.endText,
    this.centerText,
    this.centerTopText,
  );

  @override
  void paint(Canvas canvas, Size size) {
    ///半径
    double r = width / 2;
    Rect rect = Rect.fromLTRB(-r, -r, r, r);

    var bgPaint = Paint()
      ..strokeWidth = 10
      ..style = PaintingStyle.stroke
      ..color = Colors.white70;

    var progressPaint = Paint()
      ..style = PaintingStyle.stroke
      ..color = Colors.white
      ..strokeWidth = 10;

    ///1角度 =  radians弧度
    double radians = pi / 180;

    ///绘制0
    if (startText.isNotEmpty) {
      drawText(canvas, startText, r / 2, r + r * cos(radians * 30), top: 4);
    }
    ///绘制100
    if (endText.isNotEmpty) {
      drawText(
          canvas, endText, r + r * sin(radians * 30), r + r * cos(radians * 30),
          top: 4);
    }

    ///绘制中间文字
    if (centerText.isNotEmpty) {
      double top = -4;
      if (centerTopText.isNotEmpty) {
        top = 0;
      }
      drawText(canvas, centerText, r, r,
          frontSize: 24, top: top, textWidth: 50);
    }

    ///绘制中间文字上面的文字
    if (centerTopText.isNotEmpty) {
      drawText(canvas, centerTopText, r, r - 20, textWidth: 2 * r);
    }

    if (colors != null && colors.length > 0) {
      progressPaint.shader = SweepGradient(
        colors: colors,
        endAngle: radians * progress * 3,
//        stops: [0,0.5,1],
      ).createShader(rect);
    }

    canvas.translate(r, r);
    canvas.rotate(radians*120);


    canvas.drawArc(rect, radians, radians * 300, false, bgPaint);
    canvas.drawArc(
        rect, radians, radians * 3.0 * progress, false, progressPaint);

  }

  ///绘制文字
  drawText(Canvas canvas, String text, double dx, double dy,
      {double frontSize = 14, double textWidth = 40, double top = 0}) {
    var pb = ui.ParagraphBuilder(ui.ParagraphStyle(
      textAlign: TextAlign.center, //居中
      fontSize: frontSize, //大小
    ));

    ///文字颜色
    pb.pushStyle(ui.TextStyle(color: Colors.white));
    //添加文字
    pb.addText(text);

    ///文本宽度
    var paragraph = pb.build()
      ..layout(ui.ParagraphConstraints(width: textWidth));

    ///绘制文字 因为文字有宽度textWidth，所以需要dx-textWidth/2，达到居中。 top 留top的空隙
    canvas.drawParagraph(paragraph, Offset(dx - textWidth / 2, dy + top));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
