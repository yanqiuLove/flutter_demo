import 'package:flutter/material.dart';
import 'package:flutter_state/one/one_view.dart';
import 'package:get/get.dart';
import 'package:keframe/frame_separate_widget.dart';
import 'package:keframe/size_cache_widget.dart';

class One111Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('第一1-1-1页'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Center(
          child: SizeCacheWidget(
            child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return FrameSeparateWidget(
                    child: GestureDetector(
                      onTap: (){
                        // RoutePredicate routePredicate = ModalRoute.withName("/One1Page/");
                        // RoutePredicate routePredicate = ModalRoute.withName("/One1Page/");

                        // Get.until((routePredicate));

                        // Get.until((route) {
                        //   debugPrint("返回的route $route");
                        //   return true;
                        // });
                      },
                      child: Text(
                        '$index 1-1-1',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ),
                  );
                }),
          ),
        ),
      ),
    );
  }
}
