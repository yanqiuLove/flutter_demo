import 'package:flutter/material.dart';

class FulBackPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FulBackPage();
  }
}

class _FulBackPage extends State<FulBackPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.only(top: 100),
        child: Column(
          children: <Widget>[
            Full(name: "A"),
            Full(name: "B"),
            Full(name: "C"),
            Full(name: "D"),
            Less(name: "E"),
            GestureDetector(
              onTap: () {
                setState(() {});
              },
              child: Text("点击", style: TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                  decoration: TextDecoration.none)),
            )
          ],
        ),
      ),
    );
  }
}

class Full extends StatefulWidget {
  final String name;

  Full({Key key, this.name}) : super(key: key) {
    print("有状态组件$name:创建了");
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Full();
  }
}

class _Full extends State<Full> {
  @override
  Widget build(BuildContext context) {
    print("有状态组件${widget.name}:build了");
    return new GestureDetector(
      onTap: () {
        setState(() {});
      },
      child: Text(widget.name,
          style: TextStyle(
              fontSize: 30,
              color: Colors.black,
              decoration: TextDecoration.none)),
    );
  }
}

class Less extends StatelessWidget {
  final String name;

  Less({Key key, this.name}) : super(key: key) {
    print("无状态组件$name:创建了");
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    print("无状态组件$name:build了");
    return Text(
      name,
      style: TextStyle(
          fontSize: 30, color: Colors.black, decoration: TextDecoration.none),
    );
  }
}
