import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: FontAnimation(),
));

// 字体放大动画
class FontAnimation extends StatefulWidget {
  _FontAnimation createState() => _FontAnimation();
}

// SingleTickerProvider提供动画驱动
class _FontAnimation extends State<FontAnimation> with SingleTickerProviderStateMixin {
  // 补间动画
  Animation<double> tween;
  // 动画控制对象
  AnimationController controller;
  // 初始化状态
  @override
  void initState() {
    super.initState();
    /**
     * 创建动画控制类对象
     * duration：动画执行的时间
     * vsync：防止动画离屏之后继续消耗资源
     */
    controller = AnimationController(duration: const Duration(milliseconds: 20000),
      vsync: this);
    // 创建补间对象
    tween = Tween(begin: 0.0, end: 1.0)
      .animate(controller) // 返回animation对象
      ..addListener(() { // 添加监听
      setState(() {
        print(tween.value); // 打印补间插值
      });
    });
    controller.forward(); // 执行动画
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('字体放大动画'),),
      // 添加手势组件
      body: GestureDetector(
        onTap: (){
          // 点击文本重新执行动画
          startAnimation();
        },
        child: Center(
          child: Text(
              '字体放大',
            style: TextStyle(fontSize: 60*controller.value),
          ),
        ),
      ),
    );
  }

  // 开始执行动画
  startAnimation(){
    setState(() {
      // 从起始值开始执行动画
      controller.forward(from: 0.0);
    });
  }
  // 销毁动画
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}