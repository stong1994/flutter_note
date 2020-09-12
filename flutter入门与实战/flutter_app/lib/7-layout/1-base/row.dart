import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: LayoutDemo(),));

class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('row 示例'),),
      body: Row(
        children: <Widget>[
          Expanded(child: Text('左侧文本', textAlign: TextAlign.center,),),
          Expanded(child: Text('中间文本', textAlign: TextAlign.center,),),
          Expanded(child: FittedBox(
            fit: BoxFit.contain,
            child: const FlutterLogo(),
          )),
        ],
      ),
    );
  }
}