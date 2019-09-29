import 'dart:ui';

import 'package:baby_app/pages/tabbar/state.dart';
import 'package:baby_app/pages/webview/state.dart';
import 'package:fish_redux/fish_redux.dart';

enum IndexPageAction { onChangeTheme, openWebViewPage, openTabBarPage, openPage }

class IndexPageActionCreator {
  static Action onChangeTheme({Color color}) {
    return Action(IndexPageAction.onChangeTheme, payload: color);
  }

  static Action openWebViewPage(WebViewPageState state) {
    return Action(IndexPageAction.openWebViewPage, payload: state);
  }

  static Action openTabBarPage(TabBarPageState state) {
    return Action(IndexPageAction.openTabBarPage, payload: state);
  }

  static Action openPage(String routeName, Object data) {
    return Action(IndexPageAction.openPage, payload: new OpenPageEntity(routeName, data));
  }
}

class OpenPageEntity {
  final String routeName;
  final Object data;

  OpenPageEntity(this.routeName, this.data);
}
