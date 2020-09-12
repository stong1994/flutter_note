import 'dart:core';

class Client {
  int id;
  String name;
  int age;
  bool sex;
  Client(this.id, this.name, this.age, this.sex);

  // 将Json转换成数据类型
  factory Client.fromMap(Map<String, dynamic> json) => Client(
      json["id"],
      json["name"],
      json["age"],
      json["sex"] == 1,
  );

  // 将数据模型转换成JSON
  Map<String, dynamic> toMap() {
    var _sex = sex ? 1 : 0;
    return {
      "id": id,
      "name": name,
      "age": age,
      "sex": _sex,
    };
  }
}

