import 'dart:ui';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('画板示例'),
          ),
          body: ListView(
            children: <Widget>[
              Container(
                child: SizedBox(
                  width: 500,
                  height: 200,
                  child: CustomPaint(
                    painter: LinerPainter(),
                    child: Text(
                      '绘制直线',
                      style: TextStyle(
                        fontSize: 38,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                child: SizedBox(
                  width: 300,
                  height: 300,
                  child: CustomPaint(
                      painter: CirclePainter(),
                      child: Text(
                        '绘制圆',
                        style: TextStyle(
                          fontSize: 38,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      )),
                ),
              ),
              Container(
                child: SizedBox(
                  width: 300,
                  height: 300,
                  child: CustomPaint(
                      painter: OvalPainter(),
                      child: Text(
                        '绘制椭圆',
                        style: TextStyle(
                          fontSize: 38,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      )),
                ),
              ),
            ],
          )),
    );
  } // 画笔的宽度
}

class LinerPainter extends CustomPainter {
  // 定义画笔
  Paint _paint = Paint()
    ..color = Colors.green
    ..strokeCap = StrokeCap.round // 画笔笔触类型
    ..isAntiAlias = true // 是否启动抗锯齿
    ..blendMode = BlendMode.exclusion // 颜色混合模式
    ..style = PaintingStyle.fill // 绘画风格
    ..colorFilter =
        ColorFilter.mode(Colors.blueAccent, BlendMode.exclusion) // 颜色渲染模式
    ..maskFilter = MaskFilter.blur(BlurStyle.inner, 3) // 模糊遮罩效果
    ..filterQuality = FilterQuality.high // 颜色渲染模式的质量
    ..strokeWidth = 16;

  // 重写绘制方法
  @override
  void paint(Canvas canvas, Size size) {
    // 绘制直线
    canvas.drawLine(Offset(20, 20), Offset(300, 20), _paint);
  }

  // 重写是否需要绘制
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class CirclePainter extends CustomPainter {
  // 定义画笔
  Paint _paint = Paint()
    ..color = Colors.green
    ..strokeCap = StrokeCap.round // 画笔笔触类型
    ..isAntiAlias = true // 是否启动抗锯齿
    ..blendMode = BlendMode.exclusion // 颜色混合模式
    ..style = PaintingStyle.fill // 绘画风格
    ..colorFilter =
        ColorFilter.mode(Colors.blueAccent, BlendMode.exclusion) // 颜色渲染模式
    ..maskFilter = MaskFilter.blur(BlurStyle.inner, 3) // 模糊遮罩效果
    ..filterQuality = FilterQuality.high // 颜色渲染模式的质量
    ..strokeWidth = 16;

  // 重写绘制方法
  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(Offset(200, 150), 150, _paint);
  }

  // 重写是否需要绘制
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

// 椭圆
class OvalPainter extends CustomPainter {
  // 定义画笔
  Paint _paint = Paint()
    ..color = Colors.green
    ..strokeCap = StrokeCap.round // 画笔笔触类型
    ..isAntiAlias = true // 是否启动抗锯齿
    ..blendMode = BlendMode.exclusion // 颜色混合模式
    ..style = PaintingStyle.fill // 绘画风格
    ..colorFilter =
    ColorFilter.mode(Colors.blueAccent, BlendMode.exclusion) // 颜色渲染模式
    ..maskFilter = MaskFilter.blur(BlurStyle.inner, 3) // 模糊遮罩效果
    ..filterQuality = FilterQuality.high // 颜色渲染模式的质量
    ..strokeWidth = 16;

  // 重写绘制方法
  @override
  void paint(Canvas canvas, Size size) {
    Rect rect = Rect.fromPoints(Offset(80, 200), Offset(300, 300));
    canvas.drawOval(rect, _paint);
  }

  // 重写是否需要绘制
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }

  // 圆形矩角
//  @override
//  void paint(Canvas canvas, Size size) {
//    Rect rect = Rect.fromCircle(center: Offset(200, 200), radius: 100);
//    // 根据矩形创建
//    RRect rRect = RRect.fromRectAndRadius(rect, Radius.circular(200));
//    canvas.drawOval(rRect, _paint);
//  }

//  // 嵌套矩形
//  @override
//  void paint(Canvas canvas, Size size) {
//    Rect rect1 = Rect.fromCircle(center: Offset(150, 150), radius: 80);
//    Rect rect2 = Rect.fromCircle(center: Offset(150, 150), radius: 40);
//    // 根据矩形创建
//    RRect rRect1 = RRect.fromRectAndRadius(rect1, Radius.circular(200));
//    RRect rRect2 = RRect.fromRectAndRadius(rect2, Radius.circular(200));
//    canvas.drawDRRect(rRect1, rRect2, _paint);
//  }

  // 点
//  @override
//  void paint(Canvas canvas, Size size) {
//    canvas.drawPoints(
//        PointMode.points,
//        [
//          Offset(50, 60),
//          Offset(40, 90),
//          Offset(100, 100),
//          Offset(300, 350),
//        ],
//        _paint
//    );
//  }

  // 圆弧
//  @override
//  void paint(Canvas canvas, Size size) {
//    const PI = 3.141592653;
//    Rect rect1 = Rect.fromCircle(center: Offset(100, 0), radius: 80);
//    canvas.drawArc(rect1, 0, PI/2, true, _paint);
//
//    Rect rect2 = Rect.fromCircle(center: Offset(100, 0), radius: 80);
//    canvas.drawArc(rect2, 0, PI/2, true, _paint);
//  }

  // 路线
//  @override
//  void paint(Canvas canvas, Size size) {
//    Path path = Path()..moveTo(100, 100);
//    path.lineTo(200, 300);
//    path.lineTo(100, 200);
//    path.lineTo(150, 300);
//    path.lineTo(300, 300);
//    canvas.drawPath(path, _paint)
//  }
}
