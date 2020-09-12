import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: LayoutDemo(),));

class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('overflow box示例'),),
      body: Container(
        color: Colors.green,
        width: 200,
        height: 200,
        padding: const EdgeInsets.all(50),
        child: OverflowBox(
          alignment: Alignment.topLeft,
          maxWidth: 400,
          maxHeight: 200,
          child: Container(
            color: Colors.blue,
            width: 300,
            height: 300,
          ),
        ),
      ),
    );
  }
}