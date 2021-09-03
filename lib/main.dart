import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_state/bottom_navigation_bar_page.dart';
import 'package:flutter_state/translation/translation.dart';
import 'package:fps_monitor/widget/custom_widget_inspector.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:keframe/frame_separate_widget.dart';
import 'package:keframe/size_cache_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  GlobalKey<NavigatorState> globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    SchedulerBinding.instance.addPostFrameCallback(
        (t) => overlayState = globalKey.currentState.overlay);
    return GetMaterialApp(
      navigatorKey: globalKey,
      title: 'Flutter Demo',
      translations: Messages(), // 你的翻译
      locale: Locale('zh', 'CN'), // 将会按照此处指定的语言翻译
      fallbackLocale: Locale('en', 'US'), // 添加一个回调语言选项，以备上面指定的语言翻译不存在
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: MyHomePage(title: 'Flutter Demo Home Page'),
      home: CustomWidgetInspector(child: BottomNavigationBarPage()),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView.builder(
            itemCount: 100,
            itemBuilder: (context, index) {
              return Text(
                '$index',
                style: Theme.of(context).textTheme.headline4,
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  _listView() {
    return Center(
      child: SizeCacheWidget(
        child: ListView.builder(
            itemCount: 100,
            itemBuilder: (context, index) {
              return FrameSeparateWidget(
                child: Text(
                  '$index',
                  style: Theme.of(context).textTheme.headline4,
                ),
              );
            }),
      ),
    );
  }
}
