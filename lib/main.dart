import 'package:flutter/material.dart';
import 'pages/NewsListPage.dart';
import 'pages/TweetsListPage.dart';
import 'pages/DiscoveryListPage.dart';
import 'pages/MyInfoListPage.dart';
import 'package:flutter/cupertino.dart';
import 'utils/ThemeUtils.dart';
import 'widgets/MyDrawer.dart';

void main() => runApp(MyOSCClient());

class MyOSCClient extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new MyOSCClientState();
  }
}

class MyOSCClientState extends State<MyOSCClient> {
  final appBarTitles = ['资讯', '动弹', '发现', '我的'];
  final tabTextStyleSelected = new TextStyle(color: const Color(0xff1296db));
  final tabTextStyleNormal = new TextStyle(color: const Color(0xff969696));

  Color themeColor = ThemeUtils.currentColorTheme;

  // 页面当前选中的Tab的索引
  int _tabIndex = 0;
  var tabImages;
  var _body;
  var pages;

  Image getTabImage(path) {
    return new Image.asset(path, width: 20.0, height: 20.0);
  }

  @override
  void initState() {
    super.initState();

    pages = <Widget>[
      new NewListPage(),
      new TweetsListPage(),
      new DiscoveryListPage(),
      new MyInfoListPage()
    ];
    if (tabImages == null) {
      tabImages = [
        [
          getTabImage('images/ic_nav_news_normal.png'),
          getTabImage('images/ic_nav_news_actived.png')
        ],
        [
          getTabImage('images/ic_nav_tweet_normal.png'),
          getTabImage('images/ic_nav_tweet_actived.png')
        ],
        [
          getTabImage('images/ic_nav_discover_normal.png'),
          getTabImage('images/ic_nav_discover_actived.png')
        ],
        [
          getTabImage('images/ic_nav_my_normal.png'),
          getTabImage('images/ic_nav_my_pressed.png')
        ]
      ];
    }
  }

  TextStyle getTabTextStyle(int curIndex) {
    if (curIndex == _tabIndex) {
      return tabTextStyleSelected;
    }
    return tabTextStyleNormal;
  }

  Text getTabTitle(int curIndex) {
    return new Text(appBarTitles[curIndex], style: getTabTextStyle(curIndex));
  }

  Image getTabIcon(int curIndex) {
    if (curIndex == _tabIndex) {
      return tabImages[curIndex][1];
    }
    return tabImages[curIndex][0];
  }

  @override
  Widget build(BuildContext context) {
    _body = new IndexedStack(
      children: pages,
      index: _tabIndex,
    );
    return new MaterialApp(
      theme: new ThemeData(
        //设置页面的主题色
          primaryColor: Colors.blueAccent),
      home: new Scaffold(
        //设置AppBar标题
        appBar: new AppBar(
          //设置标题文字、样式
          title: new Text("My OSC", style: new TextStyle(color: Colors.white)),
          iconTheme: new IconThemeData(color: Colors.white),
        ),
        body: _body,
        bottomNavigationBar: new CupertinoTabBar(
          items: <BottomNavigationBarItem>[
            new BottomNavigationBarItem(
                icon: getTabIcon(0), title: getTabTitle(0)),
            new BottomNavigationBarItem(
                icon: getTabIcon(1), title: getTabTitle(1)),
            new BottomNavigationBarItem(
                icon: getTabIcon(2), title: getTabTitle(2)),
            new BottomNavigationBarItem(
                icon: getTabIcon(3), title: getTabTitle(3))
          ],
          currentIndex: _tabIndex,
          onTap: (index) {
            setState(() {
              _tabIndex = index;
            });
          },
        ),
        drawer: new MyDrawer(),
      ),
    );
  }
}
