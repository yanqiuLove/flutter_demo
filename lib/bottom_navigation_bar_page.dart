import 'package:flutter/material.dart';
import 'package:flutter_state/one/one_view.dart';
import 'package:flutter_state/three/three_view.dart';
import 'package:flutter_state/two/two_view.dart';

class BottomNavigationBarPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => BottomNavigationBarPageState();
}

class BottomNavigationBarPageState extends State<BottomNavigationBarPage> {
  int _current_index = 0; //记录当前选择的是哪一个
  final List<Widget> _pages = [
    //装在页面
    OnePage(),
    TwoPage(),
    ThreePage()
  ];

  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: _pages[_current_index], //展示组件
      bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: true,
          type: BottomNavigationBarType.fixed,
          currentIndex: _current_index,
          onTap: (int index) {
            //点击事件
            setState(() {
              //修改状态，会自动刷新Widget
              this._current_index = index;
            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "第一页"),
            BottomNavigationBarItem(icon: Icon(Icons.business), label: "第二页"),
            BottomNavigationBarItem(
                icon: Icon(Icons.my_location), label: "第三页"),
          ]),
    );
  }
}
