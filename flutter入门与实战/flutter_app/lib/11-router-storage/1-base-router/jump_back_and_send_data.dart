import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  title: '页面跳转返回示例',
  home: FirstScreen(),
));

// 第一个页面
class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('页面跳转返回示例'),),
      body: Center(
        child: RouteButton(),
      )
    );
  }
}

// 第二个页面
class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('选择一条数据'),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(8),
            child: RaisedButton(
              onPressed: () {
                // 出栈带上参数，返回上一个页面
                Navigator.pop(context, 'hi 小明');
              },
              child: Text('hi 小明'),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: RaisedButton(
              onPressed: () {
                // 出栈带上参数，返回上一个页面
                Navigator.pop(context, 'hi 小红');
              },
              child: Text('hi 小红'),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: RaisedButton(
              onPressed: () {
                // 出栈带上参数，返回上一个页面
                Navigator.pop(context, 'hi 小兰');
              },
              child: Text('hi 小兰'),
            ),
          ),
        ],
      )
    );
  }
}

// 跳转按钮
class RouteButton extends StatelessWidget{
  // 路由到第二个页面
  _navigateToSecondPage(BuildContext context) async {
    // 压栈操作等待页面返回
    final result = await Navigator.push(context, MaterialPageRoute(
        builder: (context) => SecondScreen()
    ));
    // 读取返回内容
    Scaffold.of(context).showSnackBar(
        SnackBar(content: Text('$result'),)
    );
  }

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        _navigateToSecondPage(context);
      },
      child: Text('跳转到第二个页面'),
    );
  }
}