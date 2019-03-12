import 'package:flutter/material.dart';

//资讯列表页面
class NewListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new NewsListPageState();
  }
}

class NewsListPageState extends State<NewListPage> {
  final ScrollController _controller = new ScrollController();
  final TextStyle titleTextStyle = new TextStyle(fontSize: 15.0);
  final TextStyle subTitleStyle =
      new TextStyle(color: const Color(0xFFB5BDC0), fontSize: 12.0);

  var listData;
  var slideDate;
  var currentPage;

  //SlideView slideView;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }
}
