import 'dart:ui';

import 'package:baby_app/global_store/state.dart';
import 'package:baby_app/pages/webview/page_back_btn.dart';
import 'package:baby_app/pages/webview/state.dart';
import 'package:baby_app/routes/my_router.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TabBarItem {
  final String title;
  final IconData icon;

  TabBarItem(this.title, this.icon);
}

class TabBarPageState implements GlobalBaseState, Cloneable<TabBarPageState> {
  int tabIndex;
  int tabLen;
  List<Widget> tabList;
  List<TabBarItem> tabs;
  PageController pageController;
  bool androidBackDesktop;
  @override
  Color themeColor;

  @override
  TabBarPageState clone() {
    return TabBarPageState()
      ..themeColor = themeColor
      ..tabIndex = tabIndex
      ..tabLen = tabLen
      ..tabList = tabList
      ..pageController = pageController
      ..androidBackDesktop = androidBackDesktop
      ..tabs = tabs;
  }
}

TabBarPageState initState(TabBarPageState state) {
  List<WebViewPageState> list = [
    WebViewPageState()
      ..url = "https://www.baidu.com"
      ..key = "01"
      ..title = "百度一下"
      ..canGoBack = false
      ..javascriptMode = JavascriptMode.unrestricted,
    WebViewPageState()
      ..url = "https://translate.google.cn/"
      ..key = "02"
      ..title = "Google 翻译"
      ..canGoBack = false
      ..javascriptMode = JavascriptMode.unrestricted,
    WebViewPageState()
      ..url = "http://docs.getui.com/geyan/intro/"
      ..key = "03"
      ..title = "个推"
      ..canGoBack = false
      ..javascriptMode = JavascriptMode.unrestricted,
    WebViewPageState()
      ..url = "https://flutter-io.cn/"
      ..key = "04"
      ..title = "flutter io"
      ..canGoBack = false
      ..javascriptMode = JavascriptMode.unrestricted,
  ];
  List<TabBarItem> tabs = <TabBarItem>[
    TabBarItem("首页", Icons.fiber_manual_record),
    TabBarItem("医院", Icons.local_hospital),
    TabBarItem("服务", Icons.local_laundry_service),
    TabBarItem("我的", Icons.account_box),
  ];
  List<Widget> views = [];
  list.forEach((WebViewPageState wps) {
    views.add(MyRouter.routes.buildPage(WebViewPageBack.routeName, wps));
  });
  return TabBarPageState()
    ..tabLen = list.length
    ..tabIndex = state.tabIndex ?? 0
    ..tabList = views
    ..tabs = tabs
    ..androidBackDesktop ??= false
    ..pageController = PageController(initialPage: state.tabIndex ?? 0);
}
