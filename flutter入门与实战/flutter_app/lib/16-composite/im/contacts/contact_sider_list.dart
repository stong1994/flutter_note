import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'contact_vo.dart';

class ContactSideList extends StatefulWidget {
  // 好友列表项数据
  final List<ContactVO> items;

  // 好友列表头构造器
  final IndexedWidgetBuilder headerBuilder;

  // 好友列表项构造器
  final IndexedWidgetBuilder itemBuilder;

  // 字母构造器
  final IndexedWidgetBuilder sectionBuilder;

  ContactSideList({
    Key key,
    @required this.items,
    this.headerBuilder,
    @required this.itemBuilder,
    @required this.sectionBuilder,
  }) : super(key: key);

  ContactState createState() => ContactState();
}

class ContactState extends State<ContactSideList> {
  // 列表滚动控制器
  final ScrollController scrollController = ScrollController();

  bool onNotification(ScrollNotification notification) {
    return true;
  }

  // 盘点并显示头部视图或空容器
  _isShowHeaderView(index) {
    if (index == 0 && widget.headerBuilder != null) {
      return Offstage(
        offstage: false,
        child: widget.headerBuilder(context, index),
      );
    }
    return Container();
  }

  // 根据定位判断是否显示好友列表头
  bool _shouldShowHeader(int position) {
    if (position <= 0) {
      return false;
    }
    if (position != 0 &&
        widget.items[position].seationKey !=
            widget.items[position - 1].seationKey) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          NotificationListener(
            onNotification: onNotification,
            child: ListView.builder(
                // 滚动控制器
                controller: scrollController,
                // 列表中内容长度不足一屏时，也可以滑动
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: widget.items.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      children: <Widget>[
                        // 显示列表头
//                      _shouldShowHeader(index),
                        // 用Offstage组件控制是否显示英文字母
                        Offstage(
                          offstage: _shouldShowHeader(index),
                          child: widget.sectionBuilder(context, index),
                        ),
                        Column(
                          children: <Widget>[
                            widget.itemBuilder(context, index)
                          ],
                        )
                      ],
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
