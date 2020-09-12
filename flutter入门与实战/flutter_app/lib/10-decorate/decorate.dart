import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: LayoutDemo(),
    ));

class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Opacity示例'),
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: <Widget>[
          Opacity(
            opacity: 0.3,
            child: Container(
              width: 200,
              height: 200,
              // 装饰器
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              child: Text(
                '不透明度为0.3',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                ),
              ),
            ),
          ),
          Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
                color: Colors.grey,
                // 添加所有边框
                border: Border.all(color: Colors.grey, width: 4),
                // 添加边框弧度
                borderRadius: BorderRadius.circular(36),
                image: DecorationImage(
                  image: ExactAssetImage('assets/images/1.jpeg'),
                  fit: BoxFit.none,
                )), // todo
            child: Text(
              '这是一个背景图片',
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.grey, // 阴影颜色
                    blurRadius: 8, // 模糊值
                    spreadRadius: 8, // 扩展阴影
                    offset: Offset(-1, 1) // x/y方向偏移
                    )
              ],
            ),
            child: Text(
              '阴影效果',
              style: TextStyle(
                color: Colors.black,
                fontSize: 28,
              ),
            ),
          ),
          Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: const FractionalOffset(0.5, 0), // 起始偏移量
                  end: const FractionalOffset(1, 1), // 终止偏移量
                  colors: <Color>[
                    Colors.red,
                    Colors.blue,
                    Colors.green,
                    Colors.grey,
                  ]),
            ),
            child: Container(
              width: 280,
              height: 280,
              child: Center(
                child: Text(
                  '渐变效果',
                  style: TextStyle(
                    fontSize: 26,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
          Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
              gradient: RadialGradient(
                  center: const Alignment(0, 0), // 0 0 代表中央
                  radius: 0.5, // 圆形半径
                  colors: <Color>[
                    Colors.red,
                    Colors.blue,
                    Colors.green,
                    Colors.grey,
                  ]),
            ),
            child: Container(
              width: 280,
              height: 280,
              child: Center(
                child: Text(
                  '环形渐变效果',
                  style: TextStyle(
                    fontSize: 26,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
          Container(
            width: 300,
            height: 300,
            child: Center(
              child: RotatedBox(
                quarterTurns: 3, // 270度
                child: Text(
                  '旋转盒子效果',
                  style: TextStyle(
                    fontSize: 26,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: ClipOval(
              // 固定大小
              child: SizedBox(
                width: 300,
                height: 300,
                child: Image.asset('assets/images/1.jpeg', fit: BoxFit.fill,),
              ),
            ),
          ),
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.all(
                // 圆角弧度
                Radius.circular(30),
              ),
              // 固定大小
              child: SizedBox(
                width: 300,
                height: 300,
                child: Image.asset('assets/images/1.jpeg', fit: BoxFit.fill,),
              ),
            ),
          ),
          Center(
            child: ClipRect(
              clipper: RectClip(),
              // 固定大小
              child: SizedBox(
                width: 300,
                height: 300,
                child: Image.asset('assets/images/1.jpeg', fit: BoxFit.fill,),
              ),
            ),
          ),
          Center(
            child: ClipPath(
              clipper: TriangleCliper(),
              // 固定大小
              child: SizedBox(
                width: 300,
                height: 300,
                child: Image.asset('assets/images/1.jpeg', fit: BoxFit.fill,),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// 自定义矩形裁剪
class RectClip extends CustomClipper<Rect> {
  // 重写获取剪裁范围
  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB(100, 100, size.width, size.height);
  }

  // 重写是否需要剪裁
  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return true;
  }
}

// 自定义三角形Clipper，类型为Path
class TriangleCliper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    Path path = Path();
    path.moveTo(50, 0); // 移动至起始点
    path.lineTo(0, 200); // 开始画线，从(50,0)到(0,200)
    path.lineTo(200, 0); // 画线，从(0,200)到(200,0)
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }
}