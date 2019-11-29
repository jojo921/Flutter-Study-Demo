import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_demo/stream/stream_demo_screen.dart';
import 'package:flutter_app_demo/ui/SplashPage.dart';
import 'package:flutter_app_demo/ui/container_demo_screen.dart';
import 'package:flutter_app_demo/ui/clip_board_screen.dart';
import 'package:flutter_app_demo/ui/dialog_demo_screen.dart';
import 'package:flutter_app_demo/ui/expandableListView_screen.dart';
import 'package:flutter_app_demo/ui/expansion_title_demo_screen.dart';
import 'package:flutter_app_demo/ui/grid_view_demo_screen .dart';
import 'package:flutter_app_demo/ui/image_demo_screen.dart';
import 'package:flutter_app_demo/ui/inheritedwidget_screen.dart';
import 'package:flutter_app_demo/ui/listview_demo_screen.dart';
import 'package:flutter_app_demo/ui/notification_screen.dart';
import 'package:flutter_app_demo/ui/popup_page_screen.dart';
import 'package:flutter_app_demo/ui/progress_dialog_demo_screen.dart';
import 'package:flutter_app_demo/ui/refreshIndicator_demo_screen.dart';
import 'package:flutter_app_demo/ui/stack_demo_screen.dart';
import 'package:flutter_app_demo/ui/tab_bar_view_demo_screen.dart';
import 'package:flutter_app_demo/ui/text_edit_demo_screen.dart';
import 'package:flutter_app_demo/ui/view_pager_indicator_demo.dart';
import 'package:flutter_app_demo/ui/emoji_screen.dart';
import 'package:flutter_app_demo/ui/webview_demo_screen.dart';
import 'package:flutter_app_demo/utils/route_helper.dart';
import 'package:flutter_app_demo/widget_demo/widget_demo_screen.dart';

import 'NavigatorUtils.dart';
import 'animation/voice_view_screen.dart';
import 'animation/wechat_voice_screen.dart';
import 'model/screen_model.dart';

void main() {
  runApp(MyApp());
}
/*配置routes*/

class MyApp extends StatelessWidget {
  static Map<String, WidgetBuilder> configRoutes = {
    SplashPage.sName: (context) => SplashPage(),
    WidgetDemoScreen.sName: (context) => WidgetDemoScreen(),
    Home.sName: (context) => Home(),
    GridViewDemoScreen.sName: (context) => GridViewDemoScreen(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
//      debugShowCheckedModeBanner: true,
////路由方式1   注意跳转路由的时候使用的方式使用routeName的方式
//      navigatorObservers: [
//        NavigatorUtils.getInstance(),
//      ],
//      routes: configRoutes,
//      initialRoute: "Home",

      //路由方式2
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  static final String sName = "Home";

  @override
  _HomeState createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  List<ScreenModel> demoList = List();

  @override
  void initState() {
    super.initState();
    demoList.add(ScreenModel("基础组件使用 ", WidgetDemoScreen()));
    demoList.add(ScreenModel("flutter实现微信播放语音动画 ", WeChatVoiceScreen()));
    demoList.add(ScreenModel("flutter实现微信发送语音动画 ", VoiceViewScreen()));
  }

  onItemClick(ScreenModel screenModel) {
    RouteHelper.pushWidget(context, screenModel.widget);
  }

  Widget buildItem(ScreenModel screenModel) {
    return GestureDetector(
      onTap: () {
        onItemClick(screenModel);
      },
      child: Row(
        children: <Widget>[
          screenModel.url != null
              ? Container(
                  child: CachedNetworkImage(
                    width: 100,
//                    height: 100,
                    fit: BoxFit.fitWidth,
                    imageUrl: screenModel.url,
                    placeholder: (context, url) =>
                        new CircularProgressIndicator(),
                    errorWidget: (context, url, error) => new Icon(Icons.error),
                  ),
                )
              : Container(),
          Container(margin: EdgeInsets.all(20), child: Text(screenModel.name)),
        ],
      ),
    );
  }

  ListView buildListView() {
    return ListView.separated(
      padding: new EdgeInsets.all(10),
      itemCount: demoList.length,
      itemBuilder: (BuildContext context, int index) {
        return buildItem(demoList.elementAt(index));
      },
      separatorBuilder: (context, index) {
        return Container(
          constraints: BoxConstraints.tightFor(height: 1),
          color: Colors.black45,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter 学习"),
      ),
      body: buildListView(),
    );
  }
}
