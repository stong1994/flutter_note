import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('cpertino activity indicator示例'),),
        body: Center(
          child: CupertinoActivityIndicator(
            radius: 60,
          ),
        ),
      ),
    );
  }
}