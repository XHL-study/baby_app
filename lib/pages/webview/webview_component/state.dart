import 'dart:ui';

import 'package:baby_app/global_store/state.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewComponentState implements GlobalBaseState, Cloneable<WebViewComponentState> {
  String url;
  String title;
  String key;
  bool canGoBack;

  JavascriptMode javascriptMode;
  WebViewController webViewController;

  @override
  Color themeColor;

  @override
  WebViewComponentState clone() {
    return WebViewComponentState()
      ..url = url
      ..title = title
      ..themeColor = themeColor
      ..key = key
      ..webViewController = webViewController
      ..javascriptMode = javascriptMode
      ..canGoBack ??= false;
  }
}
