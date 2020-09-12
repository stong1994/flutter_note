import 'package:flutter/material.dart';
import 'chat/message_page.dart';
import 'contacts/contacts.dart';
import 'personal/personal.dart';

// 主页面
class App extends StatefulWidget {
  @override
  AppState createState() => AppState();
}

class AppState extends State<App> {
  // 当前选中页面索引
  var currentIndex = 0;
  // 聊天页面
  MessagePage message;
  // 好友页面
  Contacts contacts;
  // 我的页面
  Personal me;

  // 根据当前索引返回不同得页面
  currentPage() {
    switch (currentIndex) {
      case 0:
        if (message == null) {
          message = MessagePage();
        }
        return message;
      case 1:
        if (contacts == null) {
          contacts = Contacts();
        }
        return contacts;
      case 2:
        if (me == null) {
          me = Personal();
        }
        return me;
      default:
    }
  }

  // 渲染某个菜单项，传入菜单标题、图片路径或图标
  _popupMenuItem(String title, {String imagePath, IconData icon}) {
    return PopupMenuItem(
      child: Row(
        children: <Widget>[
          // 判断是使用图片路径还是图标
          imagePath != null
              ? Image.asset(
            imagePath,
            width: 32,
            height: 32,
          )
              : SizedBox(
            width: 32,
            height: 32,
            child: Icon(
              icon,
              color: Colors.white,
            ),
          ),
          // 显示菜单项文本内容
          Container(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              title,
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('即时通讯'),
        actions: <Widget>[
          GestureDetector(
            onTap: (){
              // 跳转至搜索页面
              Navigator.pushNamed(context, 'search');
            },
            child: Icon(
              Icons.search,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 32, right: 20),
            child: GestureDetector(
              onTap: () {
                // 弹出菜单
                showMenu(
                    context: context,
                    position: RelativeRect.fromLTRB(500, 76, 10, 0),
                    items: <PopupMenuEntry>[
                      _popupMenuItem('发起会话', imagePath: 'assets/images/1.jpeg'),
                      _popupMenuItem('添加好友', imagePath: 'assets/images/2.jpeg'),
                      _popupMenuItem('联系客服', icon: Icons.person),
                    ]);
              },
              // 菜单选项
              child: Icon(Icons.add),
            ),
          )
        ],
      ),
      // 底部导航按钮
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        // 当前页面索引
        currentIndex: currentIndex,
        onTap: ((index){
          setState(() {
            currentIndex = index;
          });
        }),
        // 底部导航按钮
        items: [
          // 导航按钮项传入文本和图标
          BottomNavigationBarItem(
            title: Text(
              '聊天',
              style: TextStyle(
                color: currentIndex == 0
                    ? Color(0xFF46c01b)
                    : Color(0xff999999),
              ),
            ),
            icon: currentIndex == 0 
              ? Image.asset('assets/images/3.jpeg', width: 32, height: 28,)
                : Image.asset('assets/images/4.jpeg', width: 32, height: 28,)
          ),
          BottomNavigationBarItem(
              title: Text(
                '好友',
                style: TextStyle(
                  color: currentIndex == 1
                      ? Color(0xFF46c01b)
                      : Color(0xff999999),
                ),
              ),
              icon: currentIndex == 1
                  ? Image.asset('assets/images/3.jpeg', width: 32, height: 28,)
                  : Image.asset('assets/images/4.jpeg', width: 32, height: 28,)
          ),
          BottomNavigationBarItem(
              title: Text(
                '我的',
                style: TextStyle(
                  color: currentIndex == 2
                      ? Color(0xFF46c01b)
                      : Color(0xff999999),
                ),
              ),
              icon: currentIndex == 2
                  ? Image.asset('assets/images/3.jpeg', width: 32, height: 28,)
                  : Image.asset('assets/images/4.jpeg', width: 32, height: 28,)
          ),
        ],
      ),
      // 中间显示当前页
      body: currentPage(),
    );
  }
}