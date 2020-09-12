import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'product_page.dart';
import 'chat_page.dart';
import 'home_page.dart';
import '../provider/websocket_provider.dart';
import '../provider/current_index_provider.dart';

class IndexPage extends StatefulWidget {
  @override
  IndexPageState createState() => IndexPageState();
}

class IndexPageState extends State<IndexPage> {
  // 首页
  HomePage homePage;
  // 产品页
  ProductPage productPage;
  // 聊天页
  ChatPage chatPage;
  // 判断websocket是否初始化
  bool socketInited = false;

  // 根据当前索引返回不同得页面
  currentPage() {
    // 获取当前页面索引
    int currentIndex = Provider.of<CurrentIndexProvider>(context).currentIndex;
    switch(currentIndex){
      case 0:
        if (homePage == null) {
          homePage = HomePage();
        }
        return homePage;
      case 1:
        if (productPage == null) {
          productPage = ProductPage();
        }
        return productPage;
      case 2:
        if (chatPage == null) {
          chatPage = ChatPage();
        }
        return chatPage;
    }
  }

  @override
  Widget build(BuildContext context) {
    /**
     * 首次初始化WebSocket时，需要设立一个flag，
     * 否则当页面多次刷新时，导致websocket多次连接而创建多个实例
      */
    if (!socketInited) {
      Provider.of<WebSocketProvider>(context).init();
      socketInited = true;
    }
    // 获取当前索引
    int currentIndex = Provider.of<CurrentIndexProvider>(context).currentIndex;
    return Scaffold(
      appBar: AppBar(
        title: Text('企业站实战'),
        leading: Icon(Icons.home),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: GestureDetector(
              onTap: (){},
              child: Icon(
                Icons.search,
              ),
            ),
          )
        ],
      ),
      // 当前页面
      body: currentPage(),
      // 底部导航栏
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: ((index){
          Provider.of<CurrentIndexProvider>(context).changeIndex(index);
        }),
        items: [
          BottomNavigationBarItem(
            title: Text('首页'),
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            title: Text('产品'),
            icon: Icon(Icons.apps),
          ),
          BottomNavigationBarItem(
            title: Text('联系我们'),
            icon: Icon(Icons.insert_comment),
          )
        ],
      ),
    );
  }
}