import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import '../page/index_page.dart';
import '../page/product_detail_page.dart';

// 根路由Handler返回IndexPage页面
Handler rootHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return IndexPage();
  }
);

// 产品路由Handler返回产品详情页面，传入productID参数
Handler detailHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    String productID = params['productID'].first;
    return ProductDetailPage(productID);
  }
);