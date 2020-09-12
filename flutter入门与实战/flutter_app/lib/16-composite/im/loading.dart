import 'package:flutter/material.dart';
import 'dart:async';

// 加载页面
class LoadingPage extends StatefulWidget {
  _LoadingPage createState() => _LoadingPage();
}

class _LoadingPage extends State<LoadingPage> {
  @override
  void initState() {
    super.initState();
    // 页面停留3秒
    Future.delayed(Duration(seconds: 3), () {
      print("即时通讯APP实现");
      Navigator.of(context).pushReplacementNamed("app");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: <Widget>[
          // 加载页面居中背景图
          Image.asset("assets/images/1.jpeg", fit: BoxFit.cover,)
        ],
      ),
    );
  }
}