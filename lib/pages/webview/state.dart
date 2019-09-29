import 'dart:ui';

import 'package:baby_app/global_store/state.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPageState implements GlobalBaseState, Cloneable<WebViewPageState> {
  String title;
  String url;
  String key;
  WebViewController webViewController;
  JavascriptMode javascriptMode;
  bool canGoBack;

  @override
  Color themeColor;
  @override
  WebViewPageState clone() {
    // TODO: implement clone
    return WebViewPageState()
      ..themeColor = themeColor
      ..title = title
      ..url = url
      ..key=key
      ..webViewController = webViewController
      ..javascriptMode = javascriptMode
      ..canGoBack = canGoBack;
  }

}

WebViewPageState initState(WebViewPageState args) {
  final WebViewPageState wps = WebViewPageState();
  wps.title = args.title;
  wps.url = args.url;
  wps.webViewController = args.webViewController;
  wps.javascriptMode = args.javascriptMode ??= JavascriptMode.unrestricted;
  wps.canGoBack = false;
  return wps;
}
