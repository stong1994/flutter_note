import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('cupertino button示例'),),
        body: Center(
          child: CupertinoButton(
            child: Text('Cupertino Button'),
            color: Colors.blue,
            onPressed: (){},
          ),
        ),
      ),
    );
  }
}