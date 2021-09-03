import 'package:bloc/bloc.dart';

import 'one_state.dart';

class OneCubit extends Cubit<OneState> {
  OneCubit() : super(OneState().init());
}
