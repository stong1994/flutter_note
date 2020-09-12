import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: LayoutDemo(),));

class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ConstrainedBox 示例'),),
      body: Column(
        children: <Widget>[
          ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: 150,
              minWidth: 150,
              maxWidth: 200,
              maxHeight: 200,
            ),
            child: Container(
              width: 300,
              height: 300,
              color: Colors.grey,
            ),
          ),
          Container(
            width: 300,
            height: 300,
            color: Colors.yellow,
            child: Text('normal', style: TextStyle(fontSize: 36)),
          )
        ],
      )
    );
  }
}