import 'client.dart';
import 'database.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() => runApp(MaterialApp(home: MyApp(),));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // 测试数据
  List<Client> clients = [
    Client(1, "张三", 22, false),
    Client(2, "李四", 20, true),
    Client(3, "王五", 23, false),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(('Sqflite示例')),),
      body: FutureBuilder<List<Client>>(
        // 获取所有Client
        future: DBProvider.db.getAllClient(),
        builder: (BuildContext context, AsyncSnapshot<List<Client>> snapshot) {
          // 如果有数据用列表展示
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                Client item = snapshot.data[index];
                // 滑动删除组件
                return Dismissible(
                  key: UniqueKey(),
                  background: Container(color: Colors.red,),
                  onDismissed: (direction) {
                    DBProvider.db.deleteClient(item.id);
                  },
                  child: ListTile(
                    title: Text(item.name.toString()),
                    leading: Text(item.id.toString()),
                    trailing: Checkbox(
                      onChanged: (bool value) {
                        // 更新性别
                        DBProvider.db.updateSex(item);
                        setState(() {});
                      },
                      value: item.sex,
                    ),
                  ),
                );
              }
            );
          }else {
            // 没有数据显示缓冲动画
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          // 随机选择一条数据
          Client rnd = clients[math.Random().nextInt(clients.length)];
          // 插入数据
          await DBProvider.db.insertClient(rnd);
          setState(() {});
        },
      ),
    );
  }
}