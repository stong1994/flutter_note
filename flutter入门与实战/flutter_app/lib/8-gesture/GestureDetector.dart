import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: MyApp(),));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('按下处理Demo'),),
      body: Center(
        child: MyButton(),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 把被触摸的组件放在GestureDetector中
    return new GestureDetector(
      onTap: () {
        // 底部消息提示
        final snackBar = new SnackBar(content: new Text('你已按下'));
        Scaffold.of(context).showSnackBar(snackBar);
      },
      // 添加容器接收触摸动作
      child: new Container(
        padding: new EdgeInsets.all(12),
        decoration: new BoxDecoration(
          color: Theme.of(context).buttonColor,
          borderRadius: new BorderRadius.circular(10)
        ),
        child: Text('测试按钮'),
      )
    );
  }
}