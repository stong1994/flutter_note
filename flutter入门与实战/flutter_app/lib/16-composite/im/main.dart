import 'package:flutter/material.dart';
import 'app.dart';
import 'loading.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'search.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  title: '聊天室',
  theme: mDefaultTheme, // 自定义主题
  routes: <String, WidgetBuilder>{
    "app": (BuildContext context) => App(),
    "/friends": (_) => WebviewScaffold(
      url: "https://qq.com",
      appBar: AppBar(title: Text('Flutter官网'),),
      withZoom: true,
      withLocalStorage: true,
    ),
    "search": (BuildContext context) => Search(),
  },
  home: LoadingPage(),
));

final ThemeData mDefaultTheme = ThemeData(
  primaryColor: Colors.green,
  scaffoldBackgroundColor: Color(0xFFebebeb),
  cardColor: Colors.green,
);