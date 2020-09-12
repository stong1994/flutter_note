import 'package:flutter/material.dart';

void main() => runApp(LayoutDemo());

class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget container = Container(
      // 添加装饰效果
      decoration: BoxDecoration(
        // 背景色
        color: Colors.yellow,
      ),
      // 子元素指定为一个垂直水平嵌套布局的组件
      child: Column(
        children: <Widget>[
          // 水平布局
          Row(
            children: <Widget>[
              // 使用Expanded防止内容溢出
              Expanded(
                child: Container(
                  width: 150,
                  height: 150,
                  // 添加边框样式
                  decoration: BoxDecoration(
                    // 设置宽度、颜色
                    border: Border.all(width: 20, color: Colors.greenAccent),
                    // 设置弧度
                    borderRadius: const BorderRadius.all(const Radius.circular(8))
                  ),
                  // 设置边距
                  margin: const EdgeInsets.all(4),
                  // 添加图片
                  child: Image.asset('assets/images/1.jpeg'),
                ),
              ),
              Expanded(
                child: Container(
                  width: 150,
                  height: 150,
                  // 添加边框样式
                  decoration: BoxDecoration(
                    // 设置宽度、颜色
                      border: Border.all(width: 20, color: Colors.greenAccent),
                      // 设置弧度
                      borderRadius: const BorderRadius.all(const Radius.circular(8))
                  ),
                  // 设置边距
                  margin: const EdgeInsets.all(4),
                  // 添加图片
                  child: Image.asset('assets/images/2.jpeg'),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              // 使用Expanded防止内容溢出
              Expanded(
                child: Container(
                  width: 150,
                  height: 150,
                  // 添加边框样式
                  decoration: BoxDecoration(
                    // 设置宽度、颜色
                      border: Border.all(width: 20, color: Colors.greenAccent),
                      // 设置弧度
                      borderRadius: const BorderRadius.all(const Radius.circular(8))
                  ),
                  // 设置边距
                  margin: const EdgeInsets.all(4),
                  // 添加图片
                  child: Image.asset('assets/images/3.jpeg'),
                ),
              ),
              Expanded(
                child: Container(
                  width: 150,
                  height: 150,
                  // 添加边框样式
                  decoration: BoxDecoration(
                    // 设置宽度、颜色
                      border: Border.all(width: 20, color: Colors.greenAccent),
                      // 设置弧度
                      borderRadius: const BorderRadius.all(const Radius.circular(8))
                  ),
                  // 设置边距
                  margin: const EdgeInsets.all(4),
                  // 添加图片
                  child: Image.asset('assets/images/4.jpeg'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Container布局示例'),
        ),
        body: container,
      ),
    );
  }
}