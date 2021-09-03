import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'two_state.dart';

class TwoCubit extends Cubit<TwoState> {
  TwoCubit() : super(TwoState().init());

  ///点击某一个index 实现跟 bloc 的实现一致
  void tapIndex({@required selectedIndex}) =>
      emit(state.clone()..selectedIndex = selectedIndex);
}
