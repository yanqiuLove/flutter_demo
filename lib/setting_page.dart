import 'package:flutter/material.dart';
import 'package:flutter_state/eye_3d_page.dart';
import 'package:flutter_state/full_back_page.dart';
import 'package:flutter_state/robot/robot_view.dart';
import 'package:geniubot_chat_flutter_package/chat/models/chat_db.dart';
import 'package:geniubot_chat_flutter_package/chat/theme/theme.dart';
import 'package:get/get.dart';
import 'dart:ui' as ui;

class SettingPage extends StatelessWidget {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('设置'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              Get.changeTheme(
                  Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
            },
            child: Container(
              height: 50,
              child: Center(child: Text("切换主题")),
            ),
          ),
          SizedBox(
            height: 1,
            child: Container(
              color: Colors.black12,
            ),
          ),
          GestureDetector(
            onTap: () {
              // var locale = Locale('zh', 'CN');
              // Get.updateLocale(locale);

              var locale = Locale('zh', 'CN');
              Get.updateLocale(locale);
              debugPrint("当前语言  ${ui.window.locale}  get${Get.deviceLocale}");
            },
            child: Container(
              height: 50,
              child: Center(child: Text("changeToCN".tr)),
            ),
          ),
          SizedBox(
            height: 1,
            child: Container(
              color: Colors.black12,
            ),
          ),
          GestureDetector(
            onTap: () {
              var locale = Locale('en', 'US');
              Get.updateLocale(locale);
              debugPrint("当前语言  ${ui.window.locale}  get${Get.deviceLocale}");
            },
            child: Container(
              height: 50,
              child: Center(child: Text("changeToUS".tr)),
            ),
          ),
          SizedBox(
            height: 1,
            child: Container(
              color: Colors.black12,
            ),
          ),
          GestureDetector(
            onTap: () {
              Get.to(Eye3DPage());
            },
            child: Container(
              height: 50,
              child: Center(child: Text("裸眼3D")),
            ),
          ),
          SizedBox(
            height: 1,
            child: Container(
              color: Colors.black12,
            ),
          ),
          GestureDetector(
            onTap: () {
              ChatDB.init();
              ///初始化聊天主题，需传入Widget build(BuildContext context)中的context
              ChatTheme.init(context);
              Get.to(RobotPage());
            },
            child: Container(
              height: 50,
              child: Center(child: Text("机器人")),
            ),
          ),
          SizedBox(
            height: 1,
            child: Container(
              color: Colors.black12,
            ),
          ),
          GestureDetector(
            onTap: () {
              ChatDB.init();
              ///初始化聊天主题，需传入Widget build(BuildContext context)中的context
              ChatTheme.init(context);
              Get.to(FulBackPage());
            },
            child: Container(
              height: 50,
              child: Center(child: Text("比较")),
            ),
          ),
        ],
      ),
    );
  }
}
