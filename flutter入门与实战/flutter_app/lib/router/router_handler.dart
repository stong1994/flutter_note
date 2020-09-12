import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/11-router-storage/2-fluro/pages/second_page.dart';


// 创建handler来接收参数并返回第二个页面对象
Handler secondPageHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      // 读取goodId参数
      String goodId = params['goodId'].first;
      return SecondPage(goodId);
  }
);