import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:convert';
import '../model/product.dart';
import '../utils/utils.dart';
import '../provider/product_provider.dart';
import '../service/http_service.dart';
import '../router/application.dart';
import '../conf/configure.dart';

class HomeProductPage extends StatefulWidget {
  @override
  HomeProductPageState createState() => HomeProductPageState();
}

/**
 * 一个完整的产品数据请求渲染流程:
 * 调用数据请求方法→拼接好url→设置请求参数→发起请求→返回数据→Json解码→Json数据转换成数据模型→数据放入状态管理→notifyListeners方法通知数据刷新→ Consumer得到状态管理对象→从状态管理对象获取数据→界面渲染。
 */
class HomeProductPageState extends State<HomeProductPage> {
  @override
  void initState() {
    super.initState();
    getProductList();
  }

  // 获取产品数据
  void getProductList() async {
    // 请求url
    var url = 'http://' + Config.IP + ':'+Config.PORT + '/getProducts';
    // 请求参数
    var formData = {};
    // 调用请求方法传入url及表单数据
    await request(url, formData: formData).then((value) {
      var data = json.decode(value.toString());
      // 打印
      print('产品列表数据JSON格式：：：'+ data.toString());
      ProductListModel productList = ProductListModel.fromJson(data);
      // 数据放入状态管理
      if (productList == null) {
        Provider.of<ProductProvider>(context).getProductList([]);
      } else {
        Provider.of<ProductProvider>(context).getProductList(productList.data);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // 设备宽度
    double deviceWidth = MediaQuery.of(context).size.width;
    // 使用Consumer获取ProductProvider对象
    return Consumer<ProductProvider>(builder: (BuildContext context, ProductProvider productProvider, Widget child){
      // 获取产品列表数据
      List<ProductModel> productList = productProvider.productList;
      return Container(
        width: deviceWidth,
        color: Colors.white,
        padding: EdgeInsets.only(top: 10, bottom: 10, left: 7.5),
        child: buildProductList(context, deviceWidth, productList),
      );
    });
  }

  // 返回标题及列表
  Widget buildProductList(BuildContext context, double deviceWidth, List<ProductModel> productList) {
    double itemWidth = deviceWidth * 168.5 / 360;
    double imageWidth = deviceWidth * 110 / 360;
    // 返回产品列表
    List<Widget> listWidgets = productList.map((item) {
      var bgColor = string2Color('#f8f8f8');
      Color titleColor = string2Color('#db5d41');
      Color subtitleColor = string2Color('#999999');
      return InkWell(
        onTap: () {
          Application.router.navigateTo(context, "/detail?productID=${item.productID}");
        },
        child: Container(
          width: itemWidth,
          margin: EdgeInsets.only(bottom: 5, left: 2),
          padding: EdgeInsets.only(top: 10, left: 13, bottom: 7),
          color: bgColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                item.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 15, color: titleColor),
              ),
              Text(
                item.desc,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 15, color: subtitleColor),
              ),
              Container(
                alignment: Alignment(0, 0),
                margin: EdgeInsets.only(top: 5),
                child: Image.network(
                  item.imageUrl,
                  width: imageWidth,
                  height: imageWidth,
                ),
              )
            ],
          ),
        ),
      );
    }).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 5, bottom: 10),
          child: Text(
            '最新产品',
            style: TextStyle(
              fontSize: 16,
              color: Color.fromRGBO(51, 51, 51, 1),
            ),
          ),
        ),
        // 流式布局
        Wrap(
          spacing: 2,
          children: listWidgets,
        )
      ],
    );
  }
}