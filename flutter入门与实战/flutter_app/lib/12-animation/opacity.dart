import 'package:flutter/material.dart';

void main()=>runApp(MaterialApp(home: OpacityAnimation(),));

// 淡入淡出动画
class OpacityAnimation extends StatefulWidget {
  @override
  _OpacityAnimation createState() => _OpacityAnimation();
}

class _OpacityAnimation extends State<OpacityAnimation> {
  bool _visible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('淡入淡出动画'),),
      body: Center(
        // 添加Opacity动画
        child: AnimatedOpacity(
          opacity: _visible? 1.0: 0,
          duration: Duration(
            milliseconds: 1000,
          ),
          child: Container(
            width: 300,
            height: 300,
            color: Colors.deepPurple,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _visible = !_visible;
          });
        },
        tooltip: '显示/隐藏',
        child: Icon(Icons.flip),
      ),
    );
  }
}