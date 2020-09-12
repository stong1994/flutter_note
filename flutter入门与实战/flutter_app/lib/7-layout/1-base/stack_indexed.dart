import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: LayoutDemo(),));

class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var stack = IndexedStack(
      index: 1,
      alignment: const FractionalOffset(0.2, 0.2),
      children: <Widget>[
        // 底部添加一个头像
        CircleAvatar(
          backgroundImage: AssetImage('assets/images/1.jpeg'),
          radius: 100,
        ),
        // 上边再放一个容器，容器中再放一个文本
        // 索引为1
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
      appBar: AppBar(title: Text('stack indexed示例'),),
      body: stack,
    );
  }
}