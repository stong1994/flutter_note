import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 添加文本编辑控制器，监听文本内容变化
    final TextEditingController controller = TextEditingController();
    controller.addListener(() { 
      print('输入内容为：${controller.text}');
    });

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('text field示例'),),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: TextField(
              // 绑定controller
              controller: controller,
              // 最大长度
              maxLength: 30,
              // 最大行数
              maxLines: 1,
              // 是否自动更正
              autocorrect: true,
              // 自动对焦
              autofocus: true,
              // 是否是密码
              obscureText: false,
              // 文本对齐方式
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 26, color: Colors.green),
              // 内容更改时回调
              onChanged: (text) {
                print('文本内容改变时回调 $text');
              },
              // 内容提交时回调
              onSubmitted: (text) {
                print('文本内容提交时回调 $text');
              },
              enabled: true, // 是否禁用
              decoration: InputDecoration(
                fillColor: Colors.grey.shade200,
                filled: true,
                helperText: '用户名',
                prefixIcon: Icon(Icons.person),
                suffixText: '请输入用户名',
              ),
            ),
          ),
        ),
      )
    );
  }
}