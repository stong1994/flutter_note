import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'client.dart';
import 'dart:async';
import 'package:path/path.dart';

class DBProvider {
  DBProvider._();
  static final DBProvider db = DBProvider._();
  Database _database;
  // 获取database对象
  Future<Database> get database async {
    // 使用单例模式创建
    if (_database != null) {
      return _database;
    }
    _database = await initDB();
    return _database;
  }
  // 初始化数据库
  initDB() async {
    // 获取文档目录对象
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    // 获取默认数据库位置
    String path = join(documentsDirectory.path, "client.db");
    // 打开数据库，传入路径、版本号、打开完成回调函数
    return await openDatabase(path, version: 1, onOpen: (db){},
        onCreate: (Database db, int version) async {
          await db.execute("CREATE TABLE Client ("
              "id INTEGER PRIMARY KEY,"
              "name TEXT,"
              "age INTEGER,"
              "sex BIT"
          ")"
        );
    });
  }
  // 新增Client
  insertClient(Client newClient) async {
    final db = await database;
    // 获取表中最大id再加1作为新id
    var table = await db.rawQuery("SELECT MAX(id)+1 as id FROM Client");
    int id = table.first["id"];
    var raw = await db.rawInsert(
      "INSERT INTO Client (id, name, age, sex) VALUES (?,?,?,?)",
      [id, newClient.name, newClient.age, newClient.sex]
    );
  }
  // 修改性别
  updateSex(Client client) async {
    final db = await database;

    Client newClient = Client(
      client.id,
      client.name,
      client.age,
      !client.sex,
    );
    var res = await db.update("Client", newClient.toMap(), where: "id=?",
      whereArgs: [client.id]);
    return res;
  }
  // 根据ID读取client
  getClient(int id) async {
    final db = await database;
    var res = await db.query("Client", where: "id=?", whereArgs: [id]);
    return res.isNotEmpty? Client.fromMap(res.first) : null;
  }

  // 获取所有Client
  Future<List<Client>> getAllClient() async {
    final db = await database;
    var res = await db.query("Client");
    List<Client> list = res.isNotEmpty ? res.map((c) => Client.fromMap(c)).toList() : [];
    return list;
  }

  // 根据Id删除Client
  deleteClient(int id) async {
    final db = await database;
    return db.delete("Client", where: "id=?", whereArgs: [id]);
  }
  // 删除所有
  deleteAll() async {
    final db = await database;
    db.rawDelete("Delete * from Client");
  }
}