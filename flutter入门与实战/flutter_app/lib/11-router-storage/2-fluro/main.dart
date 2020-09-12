import 'package:flutter/material.dart';
import 'package:flutter_app/router/routers.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_app/router/application.dart';
import 'package:flutter_app/11-router-storage/2-fluro/pages/first_page.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 创建路由对象
    final router = Router();
    // 配置路由集Routers的路由对象
    Routes.configureRoutes(router);
    // 指定Application的路由对象
    Application.router = router;

    return Container(
      child: MaterialApp(
        title: 'Fluro示例',
        debugShowCheckedModeBanner: false,
        // 生成路由的回调函数，当导航到目标路由时，会使用回调函数来生成界面
        onGenerateRoute: Application.router.generator,
        // 指定主页
        home: FirstPage(),
      ),
    );
  }
}