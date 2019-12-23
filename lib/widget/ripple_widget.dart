import 'package:flutter/material.dart';

///水波纹widget
class RippleWidget extends StatelessWidget{

  final Function onTap;
  final Widget child;
  final Color splashColor;
  final Function onLongPress;

  RippleWidget({this.child, this.onTap, this.splashColor = Colors.white70, this.onLongPress});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: child,
      splashColor: splashColor,
      onTap: (){
        Future.delayed(Duration(milliseconds: 200), onTap);
      },
      onLongPress: (){
        if(onLongPress != null){
          onLongPress();
        }
      },
    );
  }

}