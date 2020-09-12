import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: LayoutDemo(),));

class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('sized box 示例'),),
      body: SizedBox(
        width: 200,
        height: 200,
        child: Card(
          color: Colors.grey,
          child: Text('Hello World!', style: TextStyle(fontSize: 36),),
        ),
      ),
    );
  }
}