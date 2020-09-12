import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  bool isMe = false;
  String userName;
  String message;
  String createAt;

  ChatMessage(this.userName, this.message, this.createAt);

  @override
  Widget build(BuildContext context) {
    // 自己的消息放在右边
    if (isMe) {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // 左侧空余
            Expanded(
              child: Container(),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(createAt, style: Theme.of(context).textTheme.subtitle1,),
                Container(
                  margin: const EdgeInsets.only(top: 5),
                  child: Text(message),
                )
              ],
            ),
            // 头像
            Container(
              margin: const EdgeInsets.only(left: 16),
              child: CircleAvatar(
                child: Text('Me'),
              ),
            )
          ],
        ),
      );
    }
    // 别人的消息放在左边
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(right: 16),
            child: CircleAvatar(
              child: Text(userName),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(createAt, style: Theme.of(context).textTheme.subtitle1,),
              Container(
                margin: const EdgeInsets.only(top: 5),
                child: Text(message),
              )
            ],
          )
        ],
      ),
    );
  }
}