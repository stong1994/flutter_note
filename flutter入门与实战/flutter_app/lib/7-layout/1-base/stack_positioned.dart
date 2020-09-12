import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: LayoutDemo(),));

class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var stack = Stack(
      children: <Widget>[
        // 添加网络图片
        Image.network('https://www.baidu.com/img/flexible/logo/pc/result.png'),
        // 定位
        Positioned(
          top: 10,
          left: 50,
          child: new Text(
            'Positioned',
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              fontFamily: 'serif',
              color: Colors.yellow,
            ),
          ),
        )
      ],
    );
    return Scaffold(
      appBar: AppBar(title: Text('stack positioned示例'),),
      body: stack,
    );
  }
}