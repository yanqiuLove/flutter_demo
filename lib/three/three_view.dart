import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_state/setting_page.dart';
import 'package:get/get.dart';
import 'package:keframe/frame_separate_widget.dart';
import 'package:keframe/size_cache_widget.dart';

import 'three_bloc.dart';
import 'three_event.dart';
import 'three_state.dart';

class ThreePage extends StatelessWidget {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ThreeBloc()..add(InitEvent()),
      child: Builder(builder: (context) => _buildPage(context)),
    );
  }

  Widget _buildPage(BuildContext context) {
    // 使用插件生成模板代码 直接在该方法中布局
    // 对于涉及到变量的组件 需要用 BlocBuilder 包裹
    // 对于赋值的触发 直接使用 生成的变量 bloc 调用 对应的event即可
    // ignore: close_sinks
    final bloc = BlocProvider.of<ThreeBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('第三页'),
        actions: [
          GestureDetector(
            onTap: () {
              debugPrint("进入设置");
              Get.to(SettingPage());
            },
            child: Container(
              width: 80,
              height: 40,
              child: Center(child: Text("设置")),
            ),
          )
        ],
      ),
      body: Container(
          alignment: Alignment.center,
          child: Stack(
            children: [
              Center(
                child: SizeCacheWidget(
                  child: ListView.builder(
                      itemCount: 100,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            // BlocProvider.of<ThreeBloc>(context)
                            //     .add(TapIndexEvent(selectedIndex: index));
                            bloc.add(TapIndexEvent(selectedIndex: index));
                          },
                          child: BlocBuilder<ThreeBloc, ThreeState>(
                            builder: (context, state) {
                              return FrameSeparateWidget(
                                // placeHolder: Container(
                                //   height: 40,
                                //   color: Color.fromARGB(255, Random().nextInt(256) + 0,
                                //               Random().nextInt(256) + 0, Random().nextInt(256) + 0),
                                // ),
                                child: Row(
                                  children: [
                                    Text(
                                      '$index 和 ${state.selectedIndex.toString()}',
                                      style:
                                          Theme.of(context).textTheme.headline4,
                                    ),
                                    // FadeInImage.assetNetwork(
                                    //   placeholder:
                                    //       "assets/image/ic_share_mood_place_bg.png",
                                    //   image:
                                    //       "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fupload-images.jianshu.io%2Fupload_images%2F17536382-740519d14b2b6b7a.jpg&refer=http%3A%2F%2Fupload-images.jianshu.io&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1631087030&t=8ec834c48b67d8cbd71aadfd4137b872",
                                    //   width: 40,
                                    //   height: 40,
                                    // )
                                  ],
                                ),
                              );
                            },
                          ),
                        );
                      }),
                ),
              ),
              BlocBuilder<ThreeBloc, ThreeState>(
                builder: (context, state) {
                  return Align(
                      alignment: Alignment.centerRight,
                      child: Text("${state.weather.cityid}"));
                },
              )
            ],
          )),
      floatingActionButton: BlocBuilder<ThreeBloc, ThreeState>(
        builder: (context, state) {
          return FloatingActionButton(
            onPressed: () {
              bloc.add(ChangeWeatherEvent());
            },
            child: Icon(Icons.add),
          );
        },
      ),
    );
  }
}
