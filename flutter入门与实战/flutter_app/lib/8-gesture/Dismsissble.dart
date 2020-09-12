import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: MyApp(),));
// todo 页面的列表会自动恢复。。。
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 构建数据
    List<String> items = new List<String>.generate(30, (index) => '列表：$index');
//    var items = new Map();
//
//    for (var i = 0; i < 30; i++) {
//      items[i] = "列表项：${i + 1}";
//    }

    return Scaffold(
        appBar: AppBar(title: Text('滑动删除Demo'),),
        body: new ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {

            // 提取出被删除的项
            final item = items[index];
            return new Dismissible(
              key: new Key(item),
              // 被删除回调
              onDismissed:(direction) {
                // 移除指定项
                items.removeAt(index);
                print(items);
                // 提示消息
                Scaffold.of(context).showSnackBar(new SnackBar(content: new Text('$item 被删除了')));
              },
              child: new ListTile(
                title: new Text('这是啥 $item'),
              ),
            );
          },
        )
    );
  }
}

class MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 把被触摸的组件放在GestureDetector中
    return new GestureDetector(
        onTap: () {
          // 底部消息提示
          final snackBar = new SnackBar(content: new Text('你已按下'));
          Scaffold.of(context).showSnackBar(snackBar);
        },
        // 添加容器接收触摸动作
        child: new Container(
          padding: new EdgeInsets.all(12),
          decoration: new BoxDecoration(
              color: Theme
                  .of(context)
                  .buttonColor,
              borderRadius: new BorderRadius.circular(10)
          ),
          child: Text('测试按钮'),
        )
    );
  }
}