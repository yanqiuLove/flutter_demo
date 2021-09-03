import 'package:flutter/material.dart';
import 'package:flutter_state/bean/weather_bean.dart';

abstract class ThreeEvent {}

//初始化事件,这边目前不需要传什么值
class InitEvent extends ThreeEvent {}

// 第一步 需要定义事件的名称 以及事件是否需要参数
class TapIndexEvent extends ThreeEvent {
  final int selectedIndex;

  TapIndexEvent({@required this.selectedIndex});
}

class ChangeWeatherEvent extends ThreeEvent {
  ChangeWeatherEvent();
}
