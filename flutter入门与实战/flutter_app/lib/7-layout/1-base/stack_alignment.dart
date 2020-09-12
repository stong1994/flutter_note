import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: LayoutDemo(),));

class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var stack = Stack(
      // 子组件左上角对齐
      alignment: Alignment.topLeft,
      children: <Widget>[
        // 底部添加一个头像
        CircleAvatar(
          backgroundImage: AssetImage('assets/images/1.jpeg'),
          radius: 100,
        ),
        // 上边再放一个容器，容器中再放一个文本
        Container(
          decoration: BoxDecoration(
            color: Colors.black38,
          ),
          child: Text(
            'Hello World!',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
    return Scaffold(
      appBar: AppBar(title: Text('stack alignment示例'),),
      body: stack,
    );
  }
}