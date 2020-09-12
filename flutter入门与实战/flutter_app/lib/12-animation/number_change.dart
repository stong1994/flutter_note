import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

// 数字变化
void main()=>runApp(MaterialApp(home: ValueAnimation(),));

class ValueAnimation extends StatefulWidget {
  @override
  _ValueAnimation createState() => _ValueAnimation();
}

class _ValueAnimation extends State<ValueAnimation> with TickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: const Duration(milliseconds: 1000),
      vsync: this);
    // 创建非线性动画
    final Animation curve = CurvedAnimation(parent: _controller, curve: Curves.easeOut);
    // 创建整形补间动画
    _animation = IntTween(begin: 0, end: 10).animate(curve)..addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      }
      if (status == AnimationStatus.dismissed) {
        Navigator.pop(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    _controller.forward();
    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, Widget child) {
        return Scaffold(
          appBar: AppBar(title: Text('数字变化动画'),),
          body: Center(
            child: Text(_animation.value.toString(), style: TextStyle(
              fontSize: 40
            ),),
          ),
        );
      },
    );
  }
  // 销毁动画
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}