import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: LayoutDemo(),
));

class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('center示例'),),
      body: Center(
        child: Text(
          'Hello World',
          style: TextStyle(fontSize: 36),
        ),
      ),
    );
  }
}