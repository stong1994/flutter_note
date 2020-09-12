import 'package:flutter/material.dart';

void main() => runApp(
    MaterialApp(
      home: MyHomePage(title:'Offstage'),
    )
);

class MyHomePage extends StatefulWidget {
  final String title;
  MyHomePage({Key key, this.title}): super(key:key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // 是否显示
  bool offstate = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title), // widget指父类
      ),
      body: Center(
        child: Offstage(
          offstage: offstate,
          child: Text(
            '这是哪',
            style: TextStyle(
                fontSize: 36
            ),
          ),
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // 设置是否显示组件
          setState(() {
            offstate = !offstate;
          });
        },
        tooltip: '显示隐藏',
        child: Icon(Icons.flip),
      ),
    );
  }
}