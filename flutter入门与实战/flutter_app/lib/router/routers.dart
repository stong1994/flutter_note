import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'router_handler.dart';

// 路由集
class Routes {
  // 根路径
  static String root = "/";

// 第二个页面路径
  static String secondPage = "/secondPage";

  // 配置路由对象
  static void configureRoutes(Router router) {
    // 没有找到路由的回调
    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
          print('error:::router没有找到');
          return;
        }
    );
    // 定义第二页面路由的Handler
    router.define(secondPage, handler: secondPageHandler);
  }
}
