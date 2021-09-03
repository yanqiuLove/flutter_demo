import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state/bean/weather_bean.dart';
import 'package:flutter_state/network/network.dart';

import 'three_event.dart';
import 'three_state.dart';

// 这增加了初始化方法，请注意，如果需要进行异步请求，同时需要将相关逻辑提炼一个方法，咱们在这里配套Future和await就能解决在异步场景下同步数据问题
// 这里使用了克隆方法，可以发现，我们只要关注自己需要改变的变量就行了，其它的变量都在内部赋值好了，我们不需要去关注；这就大大的便捷了页面中有很多变量，只需要变动一俩个变量的场景
// 注意：如果变量的数据未改变，界面相关的widget是不会重绘的；只会重绘变量被改变的widget

class ThreeBloc extends Bloc<ThreeEvent, ThreeState> {
  ThreeBloc() : super(ThreeState().init());

  // view中添加的事件，会在此处回调，此处处理完数据，将数据yield，BlocBuilder就会刷新组件
  @override
  Stream<ThreeState> mapEventToState(ThreeEvent event) async* {
    if (event is InitEvent) {
      yield await init();
    } else if (event is TapIndexEvent) {
      /// 获取到event事件传递过来的值,咱们拿到这值塞进MainState中
      /// 直接在state上改变内部的值,然后yield,只能触发一次BlocBuilder,它内部会比较上次MainState对象,如果相同,就不build
      /// 可以直接在这里处理数据并返回 也可以单独在该文件里定义一个方法
      // yield state.clone()..selectedIndex = event.selectedIndex;
      yield tapIndex(event);
    } else if (event is ChangeWeatherEvent) {
      yield await changeWeather(event);
    }
  }

  Future<ThreeState> init() async {
    return state.clone();
  }

  /// 点击某一个index
  ThreeState tapIndex(TapIndexEvent event) {
    return state.clone()..selectedIndex = event.selectedIndex;
  }

  /// 改变天气
  Future<ThreeState> changeWeather(ChangeWeatherEvent event) async {
    Weather weather = await _getWeather();
    return state.clone()..weather = weather;
  }

  Future<Weather> _getWeather() async {
    Weather weather = await WeatherRepository.getWeather(cityName: "北京");
    debugPrint("获取到的天气信息 ${weather.cityid}");
    return weather;
  }
}
