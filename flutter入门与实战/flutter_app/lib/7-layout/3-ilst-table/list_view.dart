import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: LayoutDemo(),));

class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> list = <Widget>[
      ListTile(
        title: Text('深圳大道', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),),
        subtitle: Text('南山路3号'),
        leading: Icon(Icons.fastfood, color: Colors.orange,),
      ),
      ListTile(
        title: Text('南京大道', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),),
        subtitle: Text('南京路3号'),
        leading: Icon(Icons.local_hospital, color: Colors.green,),
      ),
      ListTile(
        title: Text('北京大道', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),),
        subtitle: Text('朝阳路3号'),
        leading: Icon(Icons.computer, color: Colors.deepPurple,),
      ),
      Center(
        child: Text(
          '''
  静夜思
   李白
床前明月光，
疑是地上霜。
举头望明月，
低头思故乡。
          '''
        ),
      )
    ];
    return Scaffold(
      appBar: AppBar(title: Text('ListView 示例'),),
      body: Center(
        child: ListView(
          children: list,
        )
      ),
    );
  }
}