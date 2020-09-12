import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: LayoutDemo(),));

class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('fitted box 示例'),),
      body: Container(
        color: Colors.grey,
        width: 250,
        height: 250,
        child: FittedBox(
          // 填充方式
          fit: BoxFit.contain,
          // 对齐方式
          alignment: Alignment.topLeft,
          // 内部容器
          child: Container(
            color: Colors.deepOrangeAccent,
            child: Text('缩放布局'),
          ),
        ),
      )
    );
  }
}