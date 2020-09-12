import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

// 图表动画
void main()=>runApp(MaterialApp(home: ChartsAnimation(),));

class ChartsAnimation extends StatefulWidget {
  @override
  _ChartsAnimation createState()=>_ChartsAnimation();
}

class _ChartsAnimation extends State<ChartsAnimation> with TickerProviderStateMixin {
  var height = 100.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('图表动画'),),
      body: Center(
        child: Container(
          height: 400,
          alignment: AlignmentDirectional.bottomCenter,
          // 点击处理
          child: InkWell(
            onTap: () {
              setState(() {
                height = 320.0;
              });
            },
            // 水平布局
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // 动画容器
                AnimatedContainer(
                  duration: Duration(seconds: 1),
                  width: 40,
                  height: height - 40,
                  color: Colors.green,
                ),
                AnimatedContainer(
                  margin: EdgeInsets.only(left: 10),
                  duration: Duration(seconds: 2),
                  width: 40,
                  height: height - 10,
                  color: Colors.yellow,
                ),
                AnimatedContainer(
                  margin: EdgeInsets.only(left: 10),
                  duration: Duration(seconds: 3),
                  width: 40,
                  height: height - 60,
                  color: Colors.red,
                ),
                AnimatedContainer(
                  margin: EdgeInsets.only(left: 10),
                  duration: Duration(seconds: 2),
                  width: 40,
                  height: height - 50,
                  color: Colors.blue,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}