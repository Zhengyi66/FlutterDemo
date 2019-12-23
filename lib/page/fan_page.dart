import 'package:flutter/material.dart';
import 'package:flutter_demo/widget/fan_widget.dart';

class Fanpage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('风车'),),
      body: Center(
        child: FanWidget(width: 200, height: 200, color: Colors.blue,),
      ),
    );
  }

}