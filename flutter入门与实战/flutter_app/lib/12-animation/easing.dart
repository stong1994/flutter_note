import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main()=>runApp(MaterialApp(home: EasingAnimation(),));

// 缓慢动画
class EasingAnimation extends StatefulWidget {
  @override
  _EasingAnimation createState() => _EasingAnimation();
}

class _EasingAnimation extends State<EasingAnimation> with TickerProviderStateMixin {
  // 动画控制器
  AnimationController _controller;
  // 补间动画
  Animation _animation;

  @override
  void initState() {
    super.initState();
    // 创建动画控制器，时常为2秒
    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 2));
    // 创建补间动画，从-1到0进行估值
    _animation = Tween(begin: -1.0, end: 0).animate(
      // 非线性动画
      CurvedAnimation(
        parent: _controller,
        // 缓慢动画，决定运行轨迹，快出慢进
        curve: Curves.fastOutSlowIn
      )
    )..addStatusListener(_handler);
  }

  // 动画运行状态回调
  _handler(status) {
    // 动画执行完成
    if (status == AnimationStatus.completed) {
      // 移除状态监听
      _animation.removeStatusListener(_handler);
      // 动画重置
      _controller.reset();
      // 再次创建补间动画，从0到1进行估值
      _animation = Tween(begin: 0.0, end: 1.0).animate(
          // 非线性动画
          CurvedAnimation(
              parent: _controller,
              // 缓慢动画，决定运行轨迹，快出慢进
              curve: Curves.fastOutSlowIn
          )
      )..addStatusListener((status) {
        // 监听动画状态
        if (status == AnimationStatus.completed) {
          Navigator.pop(context);
        }
      });
      // 执行动画
      _controller.forward();
    }
  }

  @override
  Widget build(BuildContext) {
    // 计算当前页面宽度
    final double width = MediaQuery.of(context).size.width;
    // 执行动画
    _controller.forward();
    return Scaffold(
      appBar: AppBar(title: Text('缓慢动画'),),
      // 动画构造器
      body: AnimatedBuilder(
        // 动画控制器
        animation: _controller,
        // 构造动画
        builder: (context, child) {
          // 采用矩阵转换
          return Transform(
            // x方向值 = 当前动画值*宽度
            transform: Matrix4.translationValues(_animation.value*width, 0, 0),
            // 移动的色块
            child: Center(
              child: Container(
                width: 200,
                height: 200,
                color: Colors.blue,
              ),
            ),
          );
        },
      ),
    );
  }

  // 销毁动画
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

