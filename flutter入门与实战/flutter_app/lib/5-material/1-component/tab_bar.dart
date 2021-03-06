import 'package:flutter/material.dart';

void main() => runApp(TabBarSample());

class TabBarSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // 添加DefaultTabController关联TabBar及TabBarView
      home: DefaultTabController(
        length: items.length, // 选项卡的数量
        child: Scaffold(
          appBar: AppBar(
            title: const Text('TabBar实例'),
            bottom: TabBar(
              isScrollable: true,
              tabs: items.map((ItemView item) { // 迭代添加选项卡按钮子项
                return Tab(
                  text: item.title,
                  icon: Icon(item.icon),
                );
              }).toList(),
            ),
          ),
          // 添加选项卡视图
          body: TabBarView(
            // 迭代显示选项卡视图
            children: items.map((ItemView item) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: SelectedView(item: item),
              );
            }).toList(),
          )
        ),
      ),
    );
  }
}

// 视图项数据
class ItemView {
  final IconData icon; // 图标
  final String title; // 标题

  const ItemView({this.title, this.icon}); // 构造方法，传入标题和图标
}

// 选项卡的类目
const List<ItemView> items  = const<ItemView>[
  const ItemView(title: '自驾', icon: Icons.directions_car),
  const ItemView(title: '自行车', icon: Icons.directions_bike),
  const ItemView(title: '轮船', icon: Icons.directions_boat),
  const ItemView(title: '公交车', icon: Icons.directions_bus),
  const ItemView(title: '火车', icon: Icons.directions_railway),
  const ItemView(title: '步行', icon: Icons.directions_walk),
];

// 被选中的视图
class SelectedView extends StatelessWidget {
  // 视图数据
  final ItemView item;

  const SelectedView({Key key, this.item}): super(key: key);

  @override
  Widget build(BuildContext context) {
    // 获取文本主题样式
    final TextStyle textStyle = Theme.of(context).textTheme.display1;
    // 添加卡片组件，展示有质感
    return Card(
      // 颜色
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max, // 垂直方向最小化处理
          crossAxisAlignment: CrossAxisAlignment.center, // 水平方向居中对齐
          children: <Widget>[
            Icon(item.icon, size: 256.0, color: textStyle.color),
            Text(item.title, style: textStyle),
          ],
        ),
      ),
    );
  }
}