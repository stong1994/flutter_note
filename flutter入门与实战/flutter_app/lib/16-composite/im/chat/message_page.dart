import 'package:flutter/material.dart';
import 'message_data.dart';
import 'message_item.dart';

// 聊天主页面
class MessagePage extends StatefulWidget {
  MessagePageState createState() => MessagePageState();
}

class MessagePageState extends State<MessagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 构造列表
      body: ListView.builder(
        itemCount: messageData.length,
        itemBuilder: (BuildContext context, int index) {
          return MessageItem(messageData[index]);
        },
      ),
    );
  }
}