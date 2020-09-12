import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('snack bar示例'),),
        body: Center(
          child: Text(
            'snack bar示例',
            style: TextStyle(fontSize: 28),
          ),
        ),
        floatingActionButton: Builder(builder: (BuildContext context) {
          return FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              Scaffold.of(context).showSnackBar(SnackBar(
                content: Text('显示snack bar'),
              ));
            },
            shape: CircleBorder(),
          );
        },),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}