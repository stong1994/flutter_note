import 'package:flutter/material.dart';
import '../common/touch_callback.dart';
import '../common/im_item.dart';

// 我的页面
class Personal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: <Widget>[
        // 头像部分实现
        Container(
          margin: const EdgeInsets.only(top: 20),
          color: Colors.white,
          height: 80,
          child: TouchCallback(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                // 添加头像
                Container(
                  margin: const EdgeInsets.only(left: 12.0, right: 15.0),
                  child: Image.asset(
                    'assets/images/5.jpeg',
                    width: 70,
                    height: 70,
                  ),
                ),
                // 用户名及账号
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        '一休',
                        style:
                            TextStyle(fontSize: 14, color: Color(0xFFa9a9a9)),
                      )
                    ],
                  ),
                ),
                // 二维码显示
                Container(
                  margin: const EdgeInsets.only(left: 12, right: 15),
                  child: Image.asset(
                    'assets/images/6.jpeg',
                    width: 24,
                    height: 24,
                  ),
                )
              ],
            ),
            onPressed: () {},
          ),
        ),
        // 列表项
        Container(
          margin: const EdgeInsets.only(top: 20),
          color: Colors.white,
          child: ImItem(
            title: '好友动态',
            imagePath: 'assets/images/7.jpeg',
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 20),
          color: Colors.white,
          child: Column(
            children: <Widget>[
              ImItem(
                imagePath: 'assets/images/1.jpeg',
                title: '消息管理',
              ),
              Padding(
                padding: EdgeInsets.only(left: 15, right: 15),
                child: Divider(
                  height: 0.5,
                  color: Color(0xFFd9d9d9),
                ),
              ),
              ImItem(
                imagePath: 'assets/images/2.jpeg',
                title: '我的相册',
              ),
              Padding(
                padding: EdgeInsets.only(left: 15, right: 15),
                child: Divider(
                  height: 0.5,
                  color: Color(0xFFd9d9d9),
                ),
              ),
              ImItem(
                imagePath: 'assets/images/3.jpeg',
                title: '我的文件',
              ),
              Padding(
                padding: EdgeInsets.only(left: 15, right: 15),
                child: Divider(
                  height: 0.5,
                  color: Color(0xFFd9d9d9),
                ),
              ),
              ImItem(
                imagePath: 'assets/images/4.jpeg',
                title: '联系客服',
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 20),
          color: Colors.white,
          child: ImItem(
            title: '清理缓存',
            imagePath: 'assets/images/5.jpeg',
          ),
        )
      ],
    ));
  }
}
