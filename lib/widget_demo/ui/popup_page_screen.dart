import 'package:flutter/material.dart';
import 'package:flutter_app_demo/widget/custom_popup_window.dart';
import 'package:flutter_app_demo/widget/popup_window.dart';

class PopupPageScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PopupPageScreenState();
  }
}

class _PopupPageScreenState extends State<PopupPageScreen> {
  GlobalKey popLeftKey;
  GlobalKey popTopKey;
  GlobalKey popRightKey;
  GlobalKey popBottomKey;
  GlobalKey popCustomKey;

  @override
  void initState() {
    super.initState();
    popLeftKey = GlobalKey();
    popTopKey = GlobalKey();
    popRightKey = GlobalKey();
    popBottomKey = GlobalKey();
    popCustomKey = GlobalKey();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PopupWindow"),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(25),
            child: Center(
              child: SizedBox(
                key: popLeftKey,
                width: 100,
                height: 60,
                child: FlatButton(
                    onPressed: () {
                      PopupWindow.showPopWindow(context, "left", popLeftKey,
                          PopDirection.left, null, 5);
                    },
                    color: Colors.green,
                    child: Text(
                      "left",
                      style: TextStyle(color: Colors.white),
                    )),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(25),
            child: Center(
              child: SizedBox(
                key: popTopKey,
                width: 100,
                height: 60,
                child: FlatButton(
                    onPressed: () {
                      PopupWindow.showPopWindow(
                          context, "top", popTopKey, PopDirection.top, null, 5);
                    },
                    color: Colors.red,
                    child: Text(
                      "top",
                      style: TextStyle(color: Colors.white),
                    )),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(25),
            child: Center(
              child: SizedBox(
                key: popRightKey,
                width: 100,
                height: 60,
                child: FlatButton(
                    onPressed: () {
                      PopupWindow.showPopWindow(context, "right", popRightKey,
                          PopDirection.right, null, 5);
                    },
                    color: Colors.amber,
                    child: Text(
                      "right",
                      style: TextStyle(color: Colors.white),
                    )),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(25),
            child: Center(
              child: SizedBox(
                key: popBottomKey,
                width: 100,
                height: 60,
                child: FlatButton(
                    onPressed: () {
                      PopupWindow.showPopWindow(context, "bottom", popBottomKey,
                          PopDirection.bottom, null, 5);
                    },
                    color: Colors.blue,
                    child: Text(
                      "bottom",
                      style: TextStyle(color: Colors.white),
                    )),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(25),
            child: Center(
              child: SizedBox(
                key: popCustomKey,
                width: 100,
                height: 60,
                child: FlatButton(
                    onPressed: () {
                      PopupWindow.showPopWindow(context, "", popCustomKey,
                          PopDirection.bottom, CoustmPopuWindow(callBack: popupCallBack,), 5);
                    },
                    color: Colors.amberAccent,
                    child: Text(
                      "Custom",
                      style: TextStyle(color: Colors.white),
                    )),
              ),
            ),
          )
        ],
      ),
    );
  }

  popupCallBack(PopupType popupType){
    print(popupType);
    switch(popupType){
      case PopupType.copy:
        break;
      case PopupType.forward:
        break;
      case PopupType.withdraw:
        break;
    }

  }
}
