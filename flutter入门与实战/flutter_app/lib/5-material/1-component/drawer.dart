import 'package:flutter/material.dart';

void main() => runApp(
  new MaterialApp(
    title: 'Drawer示例',
    home: new LayoutDemo(),
  )
);

class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('Drawer 示例'),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            // 设置用户基本信息
            UserAccountsDrawerHeader(
              accountName: new Text('nobody'),
              accountEmail: new Text('nobody@email.com'),
              currentAccountPicture: new CircleAvatar(
                backgroundImage: new AssetImage("assets/images/1.jpeg"),
              ),
              onDetailsPressed: () {},
              otherAccountsPictures: <Widget>[
                new Container(
                  child: Image.asset('assets/images/2.jpeg'),
                )
              ],
            ),
            ListTile(
              leading: new CircleAvatar(child: Icon(Icons.color_lens),),// 导航栏菜单
              title: Text('个性打扮'),
            ),
            ListTile(
              leading: new CircleAvatar(child: Icon(Icons.photo),),
              title: Text('我的相册'),
            ),
            ListTile(
              leading: new CircleAvatar(child: Icon(Icons.wifi),),
              title: Text('免流量特权'),
            ),
          ],
        ),
      ),
    );
  }
}


