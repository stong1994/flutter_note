import 'package:flutter/material.dart';

// 页面转换动画
void main()=>runApp(MaterialApp(home: HeroAnimation()));

class HeroAnimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('页面切换动画图一'),),
      body: GestureDetector(
        child: Hero(
            tag: '第一张图片',
            child: Image.asset('assets/images/1.jpeg')
        ),
        onTap: (){
          Navigator.push(context, MaterialPageRoute(
            builder: (_) {
              return DestinationPage();
            }
          ));
        },
      ),
    );
  }
}

class DestinationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('页面切换动画图二'),),
      body: GestureDetector(
        child: Hero(
            tag: '第二张图片',
            child: Image.asset('assets/images/2.jpeg')
        ),
        onTap: (){
          Navigator.pop(context);
        },
      ),
    );
  }
}