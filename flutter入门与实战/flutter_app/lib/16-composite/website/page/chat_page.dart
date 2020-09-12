import 'package:flutter/material.dart';
import 'chat_message.dart';
import 'package:date_format/date_format.dart';
import 'package:provider/provider.dart';
import '../provider/websocket_provider.dart';

class ChatPage extends StatefulWidget {
  @override
  State createState() => ChatPageState();
}

class ChatPageState extends State<ChatPage> with TickerProviderStateMixin {
  // 文本编辑控制器
  final TextEditingController textEditingController = TextEditingController();
  // 输入框获取焦点
  FocusNode textFocusNode = FocusNode();
  @override
  void initState() {
    super.initState();
  }
  @override
  void dispose() {
    super.dispose();
  }
  // 发送消息
  void handleSubmit(String text) {
    textEditingController.clear();
    if (text.length == 0 || text == "") {
      return;
    }
    // 发送公共聊天消息
    Provider.of<WebSocketProvider>(context).sendMessage('chat_public', text);
  }

  // 创建消息输入框组件
  Widget textComposerWidget() {
    return IconTheme(
      data: IconThemeData(color: Colors.blue),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          children: <Widget>[
            Flexible(
              child: TextField(
                decoration: InputDecoration.collapsed(hintText: '请输入消息'),
                controller: textEditingController,
                onSubmitted: handleSubmit,
                focusNode: textFocusNode,
              ),
            ),
            // 发送按钮
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              child: IconButton(
                icon: Icon(Icons.send),
                onPressed: ()=>handleSubmit(textEditingController.text),
              ),
            )
          ],
        ),
      ),
    );
  }

  // 根据索引创建一个带动画的消息组件
  Widget messageItem(BuildContext context, int index) {
    var item = Provider.of<WebSocketProvider>(context).messages[index];
    // 消息动画控制器
    var animate = AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    // 创建一个消息组件
    ChatMessage message = ChatMessage(
      item['userName'].toString(),
      item['msg'].toString(),
      formatDate(DateTime.now(), [HH, ':', nn, ':', ss]),
    );
    // 读取自己的userID用于判断服务器转发过来的消息是否为自己发送的消息
    String tempID = Provider.of<WebSocketProvider>(context).userID;
    if (tempID == item['userID']) {
      message.isMe = true;
    } else {
      message.isMe = false;
    }

    // 如果index等于0则执行动画，也就是最新的消息执行动画
    if (index == 0) {
      animate.forward();
      return SizeTransition(
        sizeFactor: CurvedAnimation(parent: animate, curve: Curves.easeInOut),
        axisAlignment: 0,
        child: message,
      );
    }
    return message;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Consumer<WebSocketProvider>(builder: (BuildContext context, WebSocketProvider websocketProvider, Widget child){
          var messages = websocketProvider.messages;
          return Flexible(
            child: ListView.builder(
              padding: EdgeInsets.all(8),
              reverse: true,
              itemBuilder: messageItem,
              itemCount: messages.length,
            ),
          );
        }),
        // 分割线
        Divider(
          height: 1.0,
        ),
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
          ),
          child: textComposerWidget(),
        )
      ],
    );
  }
}