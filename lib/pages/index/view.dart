import 'package:baby_app/components/custom_ui/custom_ui.dart';
import 'package:baby_app/configs/app_config.dart';
import 'package:baby_app/global_store/action.dart';
import 'package:baby_app/global_store/store.dart';
import 'package:baby_app/pages/index/action.dart';
import 'package:baby_app/pages/index/state.dart';
import 'package:baby_app/pages/list/page.dart';
import 'package:baby_app/pages/tabbar/state.dart';
import 'package:baby_app/pages/webview/state.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget buildView(IndexPageState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    appBar: CustomUI.uResizeNavBarHeight(
      child: AppBar(
        leading:null,
        elevation: AppConfig.appBarElevation,
//        backgroundColor: state.themeColor,
          titleSpacing:0,
        title: Row(
          children: <Widget>[
            FlatButton(
              onPressed: () {
                CustomUI.uAlert(viewService.context, title: "提示", content: "哦");
              },
              child: Text("点我啦"),
            ),
            Expanded(
              child: Text("标题",style: TextStyle(),textAlign: TextAlign.center,),
              flex: 1,
            ),
          ],
        ),
      ),
    ),
    body: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Center(
            child: Text("测试 fish redux ${state.themeColor}"),
          ),
          FlatButton(
            color: state.themeColor,
            onPressed: () {
              //dispatch(IndexPageActionCreator.onChangeTheme());
              GlobalStore.store.dispatch(GlobalActionCreator.changeThemeColor());
            },
            child: Text("改变主题"),
          ),
          FlatButton(
            color: state.themeColor,
            onPressed: () {
              dispatch(LifecycleCreator.initState());
            },
            child: Text("弹出框"),
          ),
          FlatButton(
            onPressed: () {
              WebViewPageState wps = WebViewPageState()
                ..url = "https://www.baidu.com"
                ..title = "百度一下";
              dispatch(IndexPageActionCreator.openWebViewPage(wps));
            },
            child: Text("打开 webview"),
          ),
          FlatButton(
            onPressed: () {
              dispatch(IndexPageActionCreator.openPage(ListPage.routeName, null));
            },
            child: Text("打开 List"),
          ),
          FlatButton(
            color: state.themeColor,
            onPressed: () {
              dispatch(IndexPageActionCreator.openTabBarPage(
                TabBarPageState()
                  ..themeColor = state.themeColor
                  ..androidBackDesktop = true
                  ..tabIndex = 3,
              ));
            },
            child: Text("打开 TabBarPage"),
          ),
          Image.asset("assets/images/a.gif"),
          Image.asset("assets/images/a.gif"),
          Padding(
            padding: EdgeInsets.fromLTRB(50.0, 0, 50.0, 0),
            child: CustomUI.uInput(state.oneCtl, null,
                borderColor: Colors.grey.shade300, height: 44, borderRadius: 3, margin: EdgeInsets.fromLTRB(0, 20, 0, 0)),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(50.0, 0, 50.0, 0),
            child: CustomUI.uInput(state.twoCtl, null,
                borderColor: Colors.grey.shade300, height: 44, borderRadius: 3, margin: EdgeInsets.fromLTRB(0, 20, 0, 0)),
          ),
        ],
      ),
    ),
  );
}
