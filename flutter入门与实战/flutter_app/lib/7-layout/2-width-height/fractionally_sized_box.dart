import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: LayoutDemo(),));

class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('FractionallySizedBox 示例'),),
      body: Column(
        children: <Widget>[
          Container(
            height: 200,
            width: 200,
            color: Colors.grey,
            child: FractionallySizedBox(
              alignment: Alignment.topLeft,
              widthFactor: 1.5,
              heightFactor: 0.5,
              child: Container(
                width: 100, // 不会生效
                color: Colors.blue,
              ),
            ),
          ),
          Container(
            height: 100,
            width: 300,
            color: Colors.yellow,
            child: Text('normal', style: TextStyle(fontSize: 36),),
          )
        ],
      )
    );
  }
}