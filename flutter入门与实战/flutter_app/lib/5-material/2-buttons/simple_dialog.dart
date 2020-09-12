import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('simple dialog 示例')),
        body: Center(
          child: SimpleDialog(
            title: const Text('对话框标题'),
            children: [
              SimpleDialogOption(
                onPressed: () {},
                child: const Text('第一行信息'),
              ),
              SimpleDialogOption(
                onPressed: () {},
                child: const Text('第二行信息'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}