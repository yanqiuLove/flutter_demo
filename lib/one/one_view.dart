import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_state/one/one_1_page.dart';
import 'package:get/get.dart';
import 'package:keframe/frame_separate_widget.dart';
import 'package:keframe/size_cache_widget.dart';

import 'one_cubit.dart';
import 'one_state.dart';

class OnePage extends StatelessWidget {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => OneCubit(),
      child: Builder(builder: (context) => _buildPage(context)),
    );
  }

  Widget _buildPage(BuildContext context) {
    final cubit = BlocProvider.of<OneCubit>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('第一页'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Center(
          child: SizeCacheWidget(
            child: ListView.builder(
                itemCount: 100,
                itemBuilder: (context, index) {
                  return FrameSeparateWidget(
                    child: GestureDetector(
                      onTap: (){
                        Get.to(One1Page());
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
