import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

import 'two_cubit.dart';
import 'two_state.dart';

class TwoPage extends StatelessWidget {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => TwoCubit(),
      child: Builder(builder: (context) => _buildPage(context)),
    );
  }

  Widget _buildPage(BuildContext context) {
    final cubit = BlocProvider.of<TwoCubit>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('第二页'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Center(
          child: ListView.builder(
              itemCount: 100,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    // _verifyStream();
                    cubit.tapIndex(selectedIndex: index);
                  },
                  child: BlocBuilder<TwoCubit, TwoState>(
                    builder: (context, state) {
                      return Row(
                        children: [
                          Text(
                            '$index cubit ${cubit.state.selectedIndex}',
                            style: Theme.of(context).textTheme.headline4,
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
                      );
                    },
                  ),
                );
              }),
        ),
      ),
    );
  }

  _verifyStream() async {
    // _testTwo();
    _testTwoPlus();
  }

  /// 优化后的StreamController
  _testTwoPlus() {
    var obs = Observable(Stream.fromIterable([1, 2, 3, 4, 5]));
    obs.listen(print);
    // obs.listen((int aaa) {
    //   debugPrint("结果$aaa");
    // }, onDone: () {
    //   debugPrint("执行完成");
    // });
  }

  _mustFun() {}

  /// 验证猜数游戏
  _testTwo() {
    StreamController<int> controller = StreamController<int>();
    final transformer =
        StreamTransformer<int, String>.fromHandlers(handleData: (value, sink) {
      if (value == 100) {
        sink.add("你猜对了");
      } else {
        sink.addError('还没猜中，再试一次吧error');
      }
    });
    controller.stream
        .transform(transformer)
        .listen((data) => print(data), onError: (err) => print(err));

    // controller.sink.add(23);
    controller.sink.add(100);
  }

  /// 验证单个stream流
  _testOne() {
    //任意类型的流
    // StreamController controller = StreamController();
    // controller.sink.add(123);
    // controller.sink.add("xyz");
    // controller.sink.add(Anything);

//创建一条处理int类型的流
    StreamController<int> numController = StreamController();

    StreamSubscription subscription =
        numController.stream.listen((data) => print("监听到的结果$data"));

    numController.sink.add(123);

    // Stream stream = Stream.fromIterable([1,2,3]);
    // int result = await sumStream(stream);
    // debugPrint("最后的结果 $result");
  }

  Future<int> sumStream(Stream<int> stream) async {
    var sum = 0;
    await for (var value in stream) {
      sum += value;
    }
    return sum;
  }
}
