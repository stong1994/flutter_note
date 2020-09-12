import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'route_handler.dart';

class Routes {
  // 根路径
  static String root = '/';
  // 产品详情路径
  static String detailsPage = '/detail';
  // 配置路由
  static void configureRoutes(Router router) {
    // 路径没有找到Handler
    router.notFoundHandler = Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params) {
        print('error::: router没有找到');
      }
    );
    // 定义产品详情路由Handler
    router.define(detailsPage, handler: detailHandler);
    // 定义根路由Handler
    router.define(root, handler: rootHandler);
  }
}