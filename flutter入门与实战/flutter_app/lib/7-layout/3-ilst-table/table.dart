import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: LayoutDemo(),));

class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Table 示例'),),
      body: Center(
        child: Table(
          // 设置列数，并指定列宽
          columnWidths: const <int, TableColumnWidth>{
            0: FixedColumnWidth(100),
            1: FixedColumnWidth(40),
            2: FixedColumnWidth(80),
            3: FixedColumnWidth(80),
          },
          // 设置边框
          border: TableBorder.all(color: Colors.black38, width: 2, style: BorderStyle.solid),
          children: const <TableRow>[
            TableRow(
              children: <Widget>[
                Text('姓名'),
                Text('性别'),
                Text('身高'),
                Text('年龄'),
              ]
            ),
            TableRow(
                children: <Widget>[
                  Text('张三'),
                  Text('男'),
                  Text('180'),
                  Text('18'),
                ]
            ),
            TableRow(
                children: <Widget>[
                  Text('李四'),
                  Text('女'),
                  Text('170'),
                  Text('16'),
                ]
            ),
            TableRow(
                children: <Widget>[
                  Text('王五'),
                  Text('男'),
                  Text('176'),
                  Text('19'),
                ]
            ),
          ],
        )
      ),
    );
  }
}