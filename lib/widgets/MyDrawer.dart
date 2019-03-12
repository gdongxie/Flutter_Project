import 'package:flutter/material.dart';

//侧滑菜单
class MyDrawer extends StatelessWidget {
  // 菜单文本前面的图标大小
  static const double IMAGE_ICON_WIDTH = 30.0;

  // 菜单后面的箭头的图标大小
  static const double ARROW_ICON_WIDTH = 16.0;

  // 菜单后面的箭头图片
  var rightArrowIcon = new Image.asset(
    'images/ic_arrow_right.png',
    width: ARROW_ICON_WIDTH,
    height: ARROW_ICON_WIDTH,
  );

  //菜单文本
  List menuTitles = ["发布动弹", "动弹小黑屋", "设置", "关于"];

  // 菜单文本前面的图标
  List menuIcons = [
    './images/leftmenu/ic_fabu.png',
    './images/leftmenu/ic_xiaoheiwu.png',
    './images/leftmenu/ic_about.png',
    './images/leftmenu/ic_settings.png'
  ];

  //菜单的文本样式
  TextStyle menuStyle = new TextStyle(
    fontSize: 15.0,
  );

  @override
  Widget build(BuildContext context) {
    return new ConstrainedBox(
      constraints: const BoxConstraints.expand(width: 300.0),
      child: new Material(
        elevation: 16.0,
        child: new ListView.builder(
          itemCount: menuTitles.length * 2 + 1,
          itemBuilder: renderRow,
          padding: const EdgeInsets.all(0.0), // 加上这一行可以让Drawer展开时，状态栏中不显示白色
        ),
      ),
    );
  }

  Widget getIconImage(path) {
    return new Padding(
      padding: const EdgeInsets.fromLTRB(2.0, 0.0, 6.0, 0.0),
      child: new Image.asset(path, width: 28.0, height: 28.0),
    );
  }

  Widget renderRow(BuildContext context, int index) {
    if (index == 0) {
      // render cover image
      var img = new Image.asset(
        './images/cover_img.jpg',
        width: 300.0,
        height: 300.0,
        fit: BoxFit.cover,
      );
      return new Container(
        width: 300.0,
        height: 300.0,
        margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
        child: img,
      );
    }
    //舍去之前的封面图
    index -= 1;
    //如果是基数 则渲染分割线
    if (index.isOdd) {
      return new Divider();
    }
    //偶数，就除2取整，然后渲染菜单Item
    index = index ~/ 2;
    //菜单的Item组件
    var listItemContent = new Padding(
      //设置Item的外边距 padding
      padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
      //Row组件构成Item的一行
      child: new Row(
        children: <Widget>[
          //菜单Item的图标
          getIconImage(menuIcons[index]),
          //菜单Item的文本
          new Expanded(
              child: new Text(
            menuTitles[index],
            style: menuStyle,
          )),
        ],
      ),
    );

    return new InkWell(
      child: listItemContent,
      onTap: () {
        switch (index) {
          //发布动弹
//          case 0:
//            Navigator.of(context).push(new MaterialPageRoute(builder: (ctx) {
//              return new PublishTweetPage();
//            }));
//            break;
//          case 1:
//            // 小黑屋
//            Navigator.of(context).push(new MaterialPageRoute(builder: (ctx) {
//              return new BlackHousePage();
//            }));
//            break;
//          case 2:
//            // 设置
//            Navigator.of(context).push(new MaterialPageRoute(builder: (ctx) {
//              return new SettingsPage();
//            }));
//            break;
//          case 3:
//            // 关于
//            Navigator.of(context).push(new MaterialPageRoute(builder: (ctx) {
//              return new AboutPage();
//            }));
//            break;
        }
      },
    );
  }
}
