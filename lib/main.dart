import 'package:flutter/material.dart';
import 'package:flutter_demo/page/circle_progress_page.dart';
import 'package:flutter_demo/page/fan_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children: <Widget>[
          _item('环形进度条', CircleProgressPage()),
          _item('风车', Fanpage())
        ],
      ),
    );
  }


  _item(String title, Widget page){
    return RaisedButton(onPressed: () => jump(page),
      child: Text(title),
    );
  }
  ///跳转
  jump(Widget page){
    Navigator.push(context, MaterialPageRoute(
        builder: (_){
          return page;
        }));
  }
}
