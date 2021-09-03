import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geniubot_chat_flutter_package/chat/chat_page.dart';
import 'package:geniubot_chat_flutter_package/chat/models/chat_message.dart';

import 'robot_cubit.dart';
import 'robot_state.dart';

class RobotPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => RobotCubit(),
      child: Builder(builder: (context) => _buildPage(context)),
    );
  }

  Widget _buildPage(BuildContext context) {
    final cubit = BlocProvider.of<RobotCubit>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text("机器人"),
        ),
        body: ChatPage(
          "aiya_version3",
          "https://dev-test.geniuworks.com/bot/aiya_version3",
          "123456789",
          "1.0.129",
          isDark: false,
          urlMessageClick: (ChatMessage chatMessage) {
            debugPrint("点击消息回调");
          },
        ));
  }
}
