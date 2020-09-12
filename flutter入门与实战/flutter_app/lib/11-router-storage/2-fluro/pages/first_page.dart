import 'package:flutter/material.dart';
import 'package:flutter_app/router/application.dart';
import 'package:fluro/fluro.dart';

// 第一个页面
class FirstPage extends StatelessWidget {
  _navigateToSecondPage(BuildContext context) async {
    String goodId = '001';
    // 指定路由，以及切换动画
    Application.router.navigateTo(
        context,
        '/secondPage?goodId=$goodId',
        transition: TransitionType.fadeIn).then((result) {// 回传值
          if (result != null) {
            print(result);
          }
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('第一个页面'),),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            _navigateToSecondPage(context);
          },
          child: Text('打开第一个页面'),
        ),
      ),
    );
  }
}