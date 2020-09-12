import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    home: LayoutDemo(),
  )
);

class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('align 示例'),
      ),
      body: Stack(
        children: <Widget>[
          // 左上角
          Align(
            // 对齐属性、确定位置
            alignment: FractionalOffset(0, 0),
            // 图片
            child: Image.asset('assets/images/1.jpeg', width: 128, height: 128,),
          ),
          // 右上角
          Align(
            // 对齐属性、确定位置
            alignment: FractionalOffset(1, 0),
            // 图片
            child: Image.asset('assets/images/1.jpeg', width: 128, height: 128,),
          ),
          // 中间
          Align(
            // 对齐属性、确定位置
            alignment: FractionalOffset(0.5, 0.5),
            // 图片
            child: Image.asset('assets/images/3.jpeg', width: 128, height: 128,),
          ),
          // 左下角
          Align(
            // 对齐属性、确定位置
            alignment: FractionalOffset(0, 1),
            // 图片
            child: Image.asset('assets/images/2.jpeg', width: 128, height: 128,),
          ),
          // 右下角
          Align(
            // 对齐属性、确定位置
            alignment: FractionalOffset(1, 1),
            // 图片
            child: Image.asset('assets/images/2.jpeg', width: 128, height: 128,),
          ),
        ],
      ),
    );
  }
}