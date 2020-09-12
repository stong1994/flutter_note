import 'package:flutter/material.dart';

void main() => runApp(
    MaterialApp(
      home: MyApp(),
    )
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wrap示例'),
      ),
      body: Wrap(
        spacing: 8,
        runSpacing: 4,
        children: <Widget>[
          Chip(
            // 添加圆形头像
            avatar: CircleAvatar(
              backgroundColor: Colors.lightGreen.shade600,
              child: Text(
                '西门',
                style: TextStyle(fontSize: 10),
              ),
            ),
            label: Text('西门吹雪'),
          ),
          Chip(
            // 添加圆形头像
            avatar: CircleAvatar(
              backgroundColor: Colors.lightGreen.shade700,
              child: Text(
                '司空',
                style: TextStyle(fontSize: 10),
              ),
            ),
            label: Text('司空摘星'),
          ),
          Chip(
            // 添加圆形头像
            avatar: CircleAvatar(
              backgroundColor: Colors.lightGreen.shade800,
              child: Text(
                '婉清',
                style: TextStyle(fontSize: 10),
              ),
            ),
            label: Text('木婉清'),
          ),
          Chip(
            // 添加圆形头像
            avatar: CircleAvatar(
              backgroundColor: Colors.lightGreen.shade900,
              child: Text(
                '一郎',
                style: TextStyle(fontSize: 10),
              ),
            ),
            label: Text('萧十一郎'),
          ),
        ],
      ),
    );
  }
}
