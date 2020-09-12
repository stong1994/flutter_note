import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    title: 'Scaffold示例',
    home: LayoutDemo(),
  )
);

class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 头部元素
      appBar: AppBar(
        title: Text('Scaffold示例'),
      ),
      // 视图内容部分
      body: Center(
        child: Text('Scaffold'),
      ),
      // 底部导航栏
      bottomNavigationBar: BottomAppBar(
        child: Container(height: 50.0,),
      ),
      // 添加FAB按钮
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: '增加',
        child: Icon(Icons.add),
      ),
      // FAB按钮居中显示
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}