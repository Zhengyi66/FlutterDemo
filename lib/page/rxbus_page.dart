import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_rxbus/flutter_rxbus.dart';

class RxbusPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _PageState();
  }

}

class _PageState extends State{

  StreamSubscription _subscription;
  int count = 0;
  String msg = '';

  @override
  void initState() {
    super.initState();
    _subscription = RxBus.getInstance().toObservable<int>().listen((event){
        count++;
        setState(() {
        });
    });

    RxBus.getInstance().register<String>((event){
        msg = event;
        setState(() {

        });
    })
;  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Rxbus Demo'),),
      body: Center(
        child: Column(
          children: <Widget>[
              Text('$count'),

              SizedBox(height: 30,),

              Text(msg),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _subscription?.cancel();
    RxBus.getInstance().unregister<String>();
    super.dispose();
  }
}

class SecondPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('第二个页面'),),
      body: Center(
        child: Column(
          children: <Widget>[

            RaisedButton(onPressed: () => RxBus.getInstance().post(0),
              child: Text('发送int类型消息)')),
          ],
        ),
      ),
    );
  }

}