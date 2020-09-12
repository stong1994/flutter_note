import 'package:flutter/material.dart';
import 'message_data.dart';
import 'package:date_format/date_format.dart';
import '../common/touch_callback.dart';

// 聊天信息项
class MessageItem extends StatelessWidget{
  final MessageData message;
  MessageItem(this.message);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(width: 0.5, color: Color(0xFFd9d9d9)))
      ),
      height: 64,
      child: TouchCallback(
        onPressed: (){},
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(left: 13, right: 13),
              child: Image.network(message.avatar, width: 48, height: 48,),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    message.title,
                    style: TextStyle(fontSize: 16, color: Color(0xFF353535)),
                    maxLines: 1,
                  ),
                  Padding(padding: const EdgeInsets.only(top: 8)),
                  Text(
                    message.subTitle,
                    style: TextStyle(fontSize: 14, color: Color(0xFFa9a9a9)),
                    maxLines: 1,
                    // 显示不完得文本用省略号表示
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            ),
            Container(
              // 时间顶部对齐
              alignment: AlignmentDirectional.topStart,
              margin: const EdgeInsets.only(top: 12, right: 12),
              child: Text(
                formatDate(message.time, [HH,":",nn,":","ss"]).toString(),
                style: TextStyle(fontSize: 14, color: Color(0xFFa9a9a9)),
              ),
            )
          ],
        ),
      ),
    );
  }
}