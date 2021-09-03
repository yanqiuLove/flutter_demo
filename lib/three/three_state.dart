import 'package:flutter_state/bean/weather_bean.dart';

class ThreeState {
  // 先 state 再 event 再 bloc 最后再 view
  // 第一步 先在state文件中定义需要的基础变量
  // 第二步 在init方法中为初始变量赋值 否则会报空安全的错
  // 第三步 实现clone中的方法
  int selectedIndex;
  Weather weather;

  ThreeState init() {
    return ThreeState()
      ..selectedIndex = 0
      ..weather = Weather();
  }

  ThreeState clone() {
    return ThreeState()
      ..selectedIndex = selectedIndex
      ..weather = weather;
  }
}
