import 'package:flutter/material.dart';
import 'package:flutter_state/one/one_1_1_1_page.dart';
import 'package:flutter_state/one/one_view.dart';
import 'package:get/get.dart';
import 'package:keframe/frame_separate_widget.dart';
import 'package:keframe/size_cache_widget.dart';

class One11Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('第一1-1页'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Center(
          child: SizeCacheWidget(
            child: ListView.builder(
                itemCount: 2,
                itemBuilder: (context, index) {
                  return FrameSeparateWidget(
                    child: GestureDetector(
                      onTap: () {
                        Get.to(One111Page()).then((value){
                          debugPrint("返回的值 $value");
                        });
                      },
                      child: Text(
                        '$index 1-1',
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
