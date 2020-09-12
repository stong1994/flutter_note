import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

void main() => runApp(
  MaterialApp(
    home: LogInfo(),
  )
);

class LogInfo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LogInfoState();
}

class LogInfoState extends State<LogInfo> {
  int log_id = 0;
  String log_info = "";
  File file;

  @override
  void initState() {
    super.initState();
    // 读取日志信息
    readLogInfo().then((String value) {
      setState(() {
        log_info = value;
      });
    });
  }

  // 获取文件对象
  Future<File> getFile() async {
    // 获取文件所在路径
    String dir = (await getApplicationDocumentsDirectory()).path;
    print('$dir:dir');
    // 创建文件
    if (file == null) {
      return File('$dir/log.txt');
    }
    print('${file.path}file');
    return file;
  }

  // 读取日志信息
  Future<String> readLogInfo() async {
    try {
      File file = await getFile();
      String contents = await file.readAsString();
      return contents;
    } on FileSystemException {
      return "";
    }
  }

  // 写入日志
  Future<Null> writeLog() async {
    // 增加日志号
    setState(() {
      log_id ++;
    });
    await (await getFile()).writeAsString('日志信息：$log_id\n', mode: FileMode.append);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('文件存储示例'),),
      body: Center(
        child: Text('$log_info'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: writeLog,
        tooltip: '写入日志',
        child: Icon(Icons.add),
      ),
    );
  }
}

