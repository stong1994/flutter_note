import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: LayoutDemo(),));

class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Container> _buildGridTitleList(int count) {
      return List<Container>.generate(count, (index) => Container(
        child: Image.asset('assets/images/${index+1}.jpeg'),
      ));
    }
    // 渲染GridView
    Widget buildGrid() {
      return GridView.extent(
          maxCrossAxisExtent: 150, // 次轴宽度
        padding: const EdgeInsets.all(4),
        mainAxisSpacing: 4, // 主轴间距
        crossAxisSpacing: 4, // 次轴间距
        children: _buildGridTitleList(9),
      );
    }
    return Scaffold(
      appBar: AppBar(title: Text('GridView 示例'),),
      body: Center(
        child: buildGrid()
      ),
    );
  }
}