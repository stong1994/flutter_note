import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var card = SizedBox(
      // 限定高度
      height: 250,
      child: Card(
        // 垂直布局
        child: Column(
          children: <Widget>[
            ListTile(
              // 标题
              title: Text('南山大道', style: TextStyle(fontWeight: FontWeight.w300),),
              subtitle: Text('雄霸天下公司'),
              // 左侧图标
              leading: Icon(Icons.home, color: Colors.lightBlue,)
            ),
            // 分割线
            Divider(),
            ListTile(
              // 标题
                title: Text('罗湖大道', style: TextStyle(fontWeight: FontWeight.w300),),
                subtitle: Text('风云天下公司'),
                // 左侧图标
                leading: Icon(Icons.school, color: Colors.lightBlue,)
            ),
            Divider(),
          ],
        ),
      ),
    );
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('card示例'),),
        body: card,
      ),
    );
  }
}