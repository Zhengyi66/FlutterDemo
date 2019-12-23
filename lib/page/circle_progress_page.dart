import 'package:flutter/material.dart';
import 'package:flutter_demo/widget/sweep_progress_widget.dart';
import 'package:flutter_demo/widget/linear_progress_widget.dart';
import 'package:flutter_demo/widget/rotate_widget.dart';

class CircleProgressPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('圆形进度条'),
      ),
      backgroundColor: Colors.white30,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            LinearProgressWidget(
              progress: 100,
              width: 120,
              height: 120,
              startText: '0',
              endText: '200',
              centerText: '100%',
              centerTopText: '当前进度',
              colors: [
                Colors.yellowAccent,
                Colors.greenAccent,
              ],
            ),
            Padding(padding: EdgeInsets.all(20)),

            SweepProgressTestWidget(
              progress: 80,
              width: 120,
              height: 120,
              startText: '0',
              endText: '200',
              centerText: '80%',
              centerTopText: '当前进度',
              colors: [
                Colors.red,
                Colors.greenAccent,
                Colors.yellowAccent
              ],
            ),

            Padding(padding: EdgeInsets.all(20)),

            RotateWidget(
              width: 120,
              height: 120,
              colors: [
                Colors.red,
                Colors.blue
              ],
            )
          ],
        ),
      ),
    );
  }
}
