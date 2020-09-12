import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: LayoutDemo(),));

class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('AspectRatio 示例'),),
      body: Container(
        height: 200,
        color: Colors.grey,
        child: AspectRatio(
          aspectRatio: 1.5, // 宽高比
          child: Container(
            width: 100, // 不会生效
            color: Colors.blue,
          ),
        ),
      )
    );
  }
}