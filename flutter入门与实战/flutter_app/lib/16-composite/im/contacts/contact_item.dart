import 'package:flutter/material.dart';
import 'contact_vo.dart';

// 好友列表项
class ContactItem extends StatelessWidget {
  //  好友数据
  final ContactVO item;
  // 标题名
  final String titleName;
  // 图片路径
  final String imageName;
  ContactItem({this.item, this.titleName, this.imageName});

  // 渲染好友列表项
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(width: 0.5, color: Color(0xFFd9d9d9)))
      ),
      height: 52,
      child: FlatButton(
        onPressed: (){},
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            imageName == null
                ? Image.network(
                  item.avatarUrl != ""
                      ? item.avatarUrl
                      : 'https://img2.woyaogexing.com/2020/09/07/6b287b05a1e246c6872359abe3aac457!400x400.jpeg',
                  width: 36,
                  height: 36,
                  scale: 0.9,
            )
                : Image.asset(imageName, width: 36, height: 36,),
            Container(
              margin: const EdgeInsets.only(left: 12),
              child: Text(
                titleName == null ? item.name ?? '暂时' : titleName,
                style: TextStyle(fontSize: 18, color: Color(0xFF353535)),
                maxLines: 1,
              ),
            )
          ],
        ),
      ),
    );
  }
}