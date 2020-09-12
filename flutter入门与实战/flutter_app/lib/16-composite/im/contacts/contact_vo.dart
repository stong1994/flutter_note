import 'package:flutter/cupertino.dart';

class ContactVO {
  // 字母排列值
  String seationKey;
  // 名称
  String name;
  // 头像URL
  String avatarUrl;

  ContactVO({@required this.seationKey, this.name, this.avatarUrl});
}

List<ContactVO> contactData = [
  ContactVO(
    seationKey: 'A',
    name: '张三',
    avatarUrl: 'https://img2.woyaogexing.com/2020/09/07/a6b36ed25b98478fb84b9099e698a0de!400x400.jpeg'
  ),
  ContactVO(
      seationKey: 'A',
      name: '阿黄',
      avatarUrl: 'https://img2.woyaogexing.com/2020/09/07/59a1087aa0b34f3bb0f7ec4ab4a4ae05!400x400.jpeg'
  ),
  ContactVO(
      seationKey: 'B',
      name: '波波',
      avatarUrl: 'https://img2.woyaogexing.com/2020/09/07/86ae20ac1a50493bb7a28f4c44015413!400x400.jpeg'
  ),
];