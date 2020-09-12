import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:web_socket_channel/io.dart';
import 'package:flutter/material.dart';
import '../utils/random_string.dart';
import '../conf/configure.dart';

class WebSocketProvider with ChangeNotifier {
  var userID = "";
  var userName = "";
  var messages = [];
  IOWebSocketChannel channel;

  init() async {
    userID = randomNumeric(6);
    userName = "u_" + randomNumeric(6);
    return await createWebsocket();
  }

  createWebsocket() async {
    channel = await IOWebSocketChannel.connect('ws://'+Config.IP+":"+Config.PORT);
    var message = {
      'type': 'joinRoom',
      'userID': userID,
      'userName': userName,
    };

    String text = json.encode(message).toString();
    channel.sink.add(text);
    channel.stream.listen((data) =>
      listenMessage(data),
      onError: onError,
      onDone: onDone,
    );
  }
  void listenMessage(data) {
    var message = jsonDecode(data);
    print('receive message:'+ data);
    if (message['type'] == 'chat_public') {
      messages.insert(0, message);
    }
    // 通知聊天页面刷新数据
    notifyListeners();
  }

  void sendMessage(type, data) {
    var message = {
      'type': 'chat_public',
      'userID': userID,
      'userName': userName,
      'msg': data,
    };
    String text = json.encode(message).toString();
    print('send message:'+ text);
    // 发送消息至服务器
    channel.sink.add(text);
  }

  // 监听消息错误回调方法
  void onError(error) {
    print('error:${error}');
  }

  // 当Websocket断开时的回调方法，此处可做重连处理
  void onDone() {
    print('WebSocket断开了');
  }

  void closeWebSocket() {
    channel.sink.close();
    print('关闭WebSocket');
    notifyListeners();
  }

}