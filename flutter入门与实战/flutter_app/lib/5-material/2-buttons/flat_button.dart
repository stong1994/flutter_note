import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('flat button示例'),),
        body: Center(
          child: FlatButton(
            color: Colors.yellow,
            onPressed: () {},
            child: Text(
              'flat button示例',
              style: TextStyle(fontSize: 28.0),
            ),
          ),
        )
      ),
    );
  }
}