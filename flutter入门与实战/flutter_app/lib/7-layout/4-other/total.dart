import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  title: '布局综合示例',
  theme: ThemeData(
    brightness: Brightness.light, // 应用程序整个主题的亮度
    primaryColor: Colors.lightGreen[600], // App主要部分的背景色
    accentColor: Colors.orange[600], // 前景色（文本、按钮）
  ),
  home: MyApp(),
));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 风景区地址部分
    Widget addrContainer = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: <Widget>[
          Expanded(
            // 垂直布局
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // 次轴水平方向对齐
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(bottom: 8), // 与下方文本间隔一段距离
                  child: Text(
                    '风景区地址',
                    style: TextStyle(
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                Text(
                  '西藏自治区首府拉萨市区西北的玛布日山',
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                )
              ],
            ),
          ),
          // 图标
          Icon(Icons.star, color: Colors.red[500],),
          Text('66')
        ],
      ),
    );

    // 按钮组
    Column buildButtonColumn(IconData icon, String label) {
      return Column(
        // 按钮界面渲染：图标+文字
        mainAxisSize: MainAxisSize.min, // 垂直方向大小最小化
        mainAxisAlignment: MainAxisAlignment.center, // 垂直方向居中对齐
        children: <Widget>[
          Icon(icon, color: Colors.lightGreen[600],),
          Container(
            padding: EdgeInsets.only(top: 8), // 具体上边图标一定距离
            child: Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Colors.lightGreen[600],
              ),
            ),
          )
        ],
      );
    }

    Widget buttonContainer = Container(
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly, // 水平方向均匀排列
          children: <Widget>[
            buildButtonColumn(Icons.call, '电话'),
            buildButtonColumn(Icons.near_me, '导航'),
            buildButtonColumn(Icons.share, '分享'),
          ] ,
      ),
    );

    // 风景区介绍文本
    Widget textContainer = Container(
      padding: const EdgeInsets.all(32),
      child: Text(
        '''
        “布达拉”或译“普陀珞珈”，为梵文“Potalaka”之音译，意为“小白花树”、“光明海岛”等，佛教传说中为观世音菩萨的常住道场，原位于印度南部，浙江舟山的普陀山之名亦源于此。公元7世纪初，松赞干布统一西藏，定都拉萨，建立起强大的吐蕃政权。641年，他与尼泊尔塔库里王朝和中原唐王朝联姻，迎娶尺尊公主和文成公主，在玛布日山上修建了宫殿。因为松赞干布把观世音菩萨作为自己的本尊佛，所以就用佛经中菩萨的住地“布达拉”来给宫殿命名，称作“布达拉宫”。当时的布达拉宫有大小房屋一千间，但是在赤松德赞统治时期遭遇雷火烧毁了一部分。后来在吐蕃王朝灭亡时，宫殿也几乎全部被毁，只留下了两座佛堂幸免于战火。此后随着西藏的政治中心移至萨迦，布达拉宫也一直处于破败之中。

1642年，五世达赖喇嘛洛桑嘉措建立了噶丹颇章政权，拉萨再度成为青藏高原的政治中心。1645年，他开始重建布达拉宫，三年后竣工，是为白宫。1653年，五世达赖入住宫中。从这时起，历代达赖喇嘛都居住在这里，重大的宗教和政治仪式也都在这里举行，布达拉宫由此成为西藏政教合一的统治中心。五世达赖去世后，为安放灵塔，宫廷总管第巴·桑结嘉措继续扩建宫殿，形成红宫。在红宫修建时，除了本地工匠，清政府和尼泊尔政府也都派出匠师参与，每天的施工者多达7700余人。整个布达拉宫到1693年基本完工，总共历时48年，耗资约白银213万两。

布达拉宫在建成后又进行过多次扩建，方形成今日之规模。1959年，十四世达赖丹增嘉措离开西藏。此后，布达拉宫就不再是政治活动的场所，而只保留了宗教的功能。1988年，中华人民共和国政府批准了一项规模浩大的布达拉宫维修计划。大修于1989年开始，按照“整旧如旧”的原则进行施工，并同时开展调查和文物登记工作。维修一期工程在1994年结束，耗资共计人民币5300万元。2005年，二期工程开工[1][2]，于2009年竣工。
        ''',
        softWrap: true,
      ),
    );
    return Scaffold (
      appBar: AppBar(
        centerTitle: true, // 标题居中
        title: Text(
          '布达拉宫风景区',
          style: TextStyle(
              color: Colors.white,
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          // 风景区图片
          Container(
            child: Image.asset(
              'assets/images/10.jpeg',
              width: 600,
              height: 240,
              fit: BoxFit.cover,
            ),
          ),
          // 风景区地址
          addrContainer,
          // 按钮组
          buttonContainer,
          // 风景区介绍
          textContainer,
        ],
      ),
    );
  }
}