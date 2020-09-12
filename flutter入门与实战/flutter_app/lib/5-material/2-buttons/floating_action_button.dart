import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'floatingActionButton示例',
      home: Scaffold(
        appBar: AppBar(
          title: Text('FloatingActionButton示例'),
        ),
        body: Center(
          child: Text(
            'FloatingActionButton示例',
            style: TextStyle(fontSize: 28.0),
          ),
        ),
        floatingActionButton: Builder(builder: (BuildContext context) {
          return FloatingActionButton(
            child: const Icon(Icons.add),
            // 提示信息
            tooltip: '请点击FloatingActionButton',
            // 前景色为白色
            foregroundColor: Colors.white,
            // 背景色
            backgroundColor: Colors.blue,
            // 未点击阴影值
            highlightElevation: 14.0,
            onPressed: () {
              // 点击回调事件
              Scaffold.of(context).showSnackBar(SnackBar(
                content: Text('你点击了FloatingActionButton'),
              ));
            },
            mini: false,
            // 圆行边
            shape: CircleBorder(),
            isExtended: false,
          );
        }),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}