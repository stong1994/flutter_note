import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main()=>runApp(MaterialApp(home: MaskAnimation(),));

// 遮罩动画
class MaskAnimation extends StatefulWidget {
  @override
  _MaskAnimation createState()=> _MaskAnimation();
}

class _MaskAnimation extends State<MaskAnimation> with TickerProviderStateMixin {
  // 动画控制器
  AnimationController _controller;
  // 容器宽高值补间对象
  Animation<double> transitionTween;
  // 容器边框弧度补间对象
  Animation<BorderRadius> borderRadius;

  @override
  void initState() {
    super.initState();
    // 构造动画控制器对象，动画时常两秒
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this
    )..addStatusListener((status) {
      // 动画执行完返回上一页
      if (status == AnimationStatus.completed) {
        Navigator.pop(context);
      }
    });
    // 创建补间对象，控制容器宽高，变化范围50-200
    transitionTween = Tween<double>(begin: 50.0, end: 200.0).animate(
      // 设置非线性动画
      CurvedAnimation(
        parent: _controller,
        curve: Curves.ease
      )
    );
    // 创建补间对象，控制容器边框弧度，从75到0
    borderRadius = BorderRadiusTween(
      begin: BorderRadius.circular(75.0),
      end: BorderRadius.circular(0)
    ).animate(
      // 设置非线性动画
        CurvedAnimation(
            parent: _controller,
            curve: Curves.ease
        )
    );
    // 执行动画
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, Widget child) {
        return Scaffold(
          appBar: AppBar(title: Text('遮罩动画'),),
          body: Center(
            // 使用层叠组件，提供上下两个组件
            child: Stack(
              children: <Widget>[
                Center(
                  //  下层容器始终不变
                  child: Container(
                    width: 200,
                    height: 200,
                    color: Colors.black12,
                  ),
                ),
                Center(
                  // 上层容器根据补间对象改变属性值进行形变
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    width: transitionTween.value,
                    height: transitionTween.value,
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: borderRadius.value,
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}