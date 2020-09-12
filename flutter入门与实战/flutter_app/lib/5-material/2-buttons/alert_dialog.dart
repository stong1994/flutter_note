import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('alert dialog示例'),),
        body: Center(
          child: AlertDialog(
            title: Text('提示'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text('是否删除？'),
                  Text('一旦删除不可修复')
                ],
              ),
            ),
          actions: <Widget>[
            FlatButton(
              child: Text('确定'),
              onPressed: (){},
            ),
            FlatButton(
              child: Text('取消'),
              onPressed: (){},
            )
          ],
          ),
        ),
      ),
    );
  }
}