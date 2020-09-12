// 消息类型：枚举类型
import 'package:flutter/material.dart';

enum MessageType {SYSTEM, PUBLIC, CHAT, GROUP}

class MessageData {
  // 头像
  String avatar;
  // 主标题
  String title;
  // 子标题
  String subTitle;
  // 消息时间
  DateTime time;
  // 消息类型
  MessageType type;

  MessageData(this.avatar, this.title, this.subTitle, this.time, this.type);
}

List<MessageData> messageData = [
  MessageData(
    'https://img2.woyaogexing.com/2020/09/07/ebb8bd8ea21440649eb97a63908e1978!400x400.jpeg',
    '一休哥',
    '突然想到得',
    DateTime.now(),
    MessageType.CHAT
  ),
  MessageData(
    'https://img2.woyaogexing.com/2020/09/07/25fe06a5fc1a45d09f3a96c197cc9fd2!400x400.jpeg',
    '哆啦A梦',
    '机器猫',
    DateTime.now(),
    MessageType.CHAT
  ),
  MessageData(
    'https://img2.woyaogexing.com/2020/09/07/18d178e59d3241b3870f6bf7d0066bb7!400x400.jpeg',
    '柯南',
    '死神',
    DateTime.now(),
    MessageType.CHAT,
  )
];