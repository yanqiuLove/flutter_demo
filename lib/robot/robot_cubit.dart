import 'package:bloc/bloc.dart';

import 'robot_state.dart';

class RobotCubit extends Cubit<RobotState> {
  RobotCubit() : super(RobotState().init());
}
