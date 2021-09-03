import 'package:flutter/material.dart';
import 'package:flutter_state/one/one_1_1_page.dart';
import 'package:get/get.dart';
import 'package:keframe/frame_separate_widget.dart';
import 'package:keframe/size_cache_widget.dart';

class One1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('第一1页'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Center(
          child: SizeCacheWidget(
            child: ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) {
                  return FrameSeparateWidget(
                    child: GestureDetector(
                      onTap: (){
                        Get.to(One11Page());
                      },
                      child: Text(
                        '$index',
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
