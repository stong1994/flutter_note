import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: LayoutDemo(),));

class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Transform 示例'),),
      body: Center(
        child: Container(
          // 背景颜色
          color: Colors.grey,
          // 矩阵变换
          child: Transform(
            // 对齐方式
            alignment: Alignment.topRight,
            // 设置旋转值
            transform: Matrix4.rotationZ(0.3),
            // 被旋转容器
            child: Container(
              padding: const EdgeInsets.all(8),
              color: const Color(0xFFE8581C),
              child: const Text('Transform矩阵变换'),
            ),
          ),
        )
      ),
    );
  }
}