import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: LayoutDemo(),
));

class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('padding示例'),),
      body: Center(
        child: Container(
          width: 300,
          height: 300,
          padding: EdgeInsets.all(60), // 改变padding的值，查看效果
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.green,
              width: 8,
            )
          ),
          child: Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Colors.blue,
                width: 8
              )
            ),
            child: FlutterLogo(),
          ),
        ),
      ),
    );
  }
}