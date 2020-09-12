import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: LayoutDemo(),));

class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Row(
        // 水平等间距排列子组件
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          // 设置基准线
          Baseline(
            baseline: 80,
            // 对齐字符底部水平线
            baselineType: TextBaseline.alphabetic,
            child: Text(
              'AaBbCc',
              style: TextStyle(
                fontSize: 18,
                textBaseline: TextBaseline.alphabetic,
              ),
            ),
          ),
          Baseline(
            baseline: 80,
            // 对齐字符底部水平线
            baselineType: TextBaseline.alphabetic,
            child: Container(
              width: 40,
              height: 40,
              color: Colors.green,
            ),
          ),
          Baseline(
            baseline: 80,
            // 对齐字符底部水平线
            baselineType: TextBaseline.alphabetic,
            child: Text(
              'DdEeFf',
              style: TextStyle(
                fontSize: 18,
                textBaseline: TextBaseline.alphabetic,
              ),
            ),
          ),
        ],
      ),
    );
  }
}