import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('alert dialog示例'),),
        body: Center(
          child: CupertinoAlertDialog(
            title: Text('提示'),
            content: SingleChildScrollView(
              // 对话框部分
              child: ListBody(
                children: <Widget>[
                  Text('是否删除？'),
                  Text('一旦删除不可修复')
                ],
              ),
            ),
            // 对话框按钮
            actions: <Widget>[
              CupertinoDialogAction(
                child: Text('确定'),
                onPressed: (){},
              ),
              CupertinoDialogAction(
                child: Text('取消'),
                onPressed: (){},
              ),
            ],
          ),
        ),
      ),
    );
  }
}