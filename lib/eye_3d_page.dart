import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sensors/sensors.dart';
import 'package:flutter/cupertino.dart';

const int duration = 16 * 12;

class Eye3DPage extends StatefulWidget {
  _Eye3DPageState createState() => _Eye3DPageState();
}

class _Eye3DPageState extends State<Eye3DPage> {
  StreamSubscription<AccelerometerEvent> _streamSubscription;
  Size size;

  double x = 0;
  double y = 0;

  @override
  void initState() {
    super.initState();
    _streamSubscription =
        accelerometerEvents.listen((AccelerometerEvent event) async {
      setState(() {
        x = event.x * 2.5;
        y = event.y * 1.8;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _streamSubscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Material(
      color: Colors.white,
      child: Column(
        children: [
          Container(
            color: Colors.white,
            width: size.width,
            height: 250,
            child: Stack(
              alignment: Alignment.center,
              children: [
                AnimatedPositioned(
                    top: y - 40,
                    right: x - 10,
                    duration: Duration(milliseconds: duration),
                    child: _bottom()),
                Positioned(child: _middle()),
                AnimatedPositioned(
                    bottom: y,
                    left: x + size.width / 4,
                    duration: Duration(milliseconds: duration),
                    child: _top()),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _bottom() {
    return Container(
      width: size.width + 60,
      height: 250,
      child: Image.asset(
        'assets/image/bottom_bg.png',
        fit: BoxFit.fill,
      ),
    );
  }

  Widget _middle() {
    return Container(
      width: size.width - 20,
      height: 200,
      child: Image.asset(
        'assets/image/middle_bg.png',
        fit: BoxFit.fill,
      ),
    );
  }

  Widget _top() {
    return Container(
      width: 200,
      height: 150,
      child: Image.asset('assets/image/top_bg.png', fit: BoxFit.fill),
    );
  }
}
