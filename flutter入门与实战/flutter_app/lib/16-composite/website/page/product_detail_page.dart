import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:provider/provider.dart';
import 'package:flutter_html/flutter_html.dart';
import '../model/product_detail_model.dart';
import '../service/http_service.dart';
import '../provider/product_detail_provider.dart';
import '../conf/configure.dart';

class ProductDetailPage extends StatefulWidget {
  final String productID;

  ProductDetailPage(this.productID);

  @override
  ProductDetailPageState createState() => ProductDetailPageState();
}

class ProductDetailPageState extends State<ProductDetailPage> {
  @override
  void initState() {
    super.initState();
    getProductDetail();
  }

  void getProductDetail() async {
    var url = 'http://' + Config.IP + ":" + Config.PORT + "/getProductDetail";
    var formData = {"productID": widget.productID};
    print('productID' + widget.productID);
    await request(url, formData: formData).then((value) {
      var data = json.decode(value.toString());
      print('产品详情数据:::'+data.toString());
      ProductDetailModel productDetailModel = ProductDetailModel.fromJson(data);
      if (productDetailModel != null) {
        Provider.of<ProductDetailProvider>(context).getProductDetail(productDetailModel.data);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductDetailProvider>(builder:(BuildContext context, ProductDetailProvider productProvider, Widget child) {
      // 获取产品详情数据
      ProductDetail detail = productProvider.productDetail;
      if (detail != null) {
        return Scaffold(
          appBar: AppBar(
            title: Text('产品详情'),
          ),
          body: ListView(
            children: <Widget>[
              Html(
                data: detail.productDetail,
              )
            ],
          ),
        );
      } else {
        return Scaffold(
          appBar: AppBar(
            title: Text('产品详情'),
          ),
          body: Center(),
        );
      }
    });
  }
}