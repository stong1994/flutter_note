import 'package:flutter/material.dart';
import 'contact_item.dart';

class ContactHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ContactItem(titleName: '新加好友', imageName: 'assets/images/4.jpeg'),
        ContactItem(titleName: '公共聊天室', imageName: 'assets/images/5.jpeg')
      ],
    );
  }
}