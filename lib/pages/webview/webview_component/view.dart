import 'package:baby_app/configs/app_config.dart';
import 'package:baby_app/global_store/action.dart';
import 'package:baby_app/global_store/store.dart';
import 'package:baby_app/pages/webview/action.dart';
import 'package:baby_app/pages/webview/webview_component/action.dart';
import 'package:baby_app/pages/webview/webview_component/state.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../state.dart';

Widget buildView(WebViewComponentState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    appBar: AppBar(
      leading: state.canGoBack
          ? IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                dispatch(WebViewComponentActionCreator.canPageGoBack(close: false));
              })
          : null,
      elevation: AppConfig.appBarElevation,
      backgroundColor: state.themeColor,
      title: Text(state.title ?? "没有网络地址"),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.new_releases),
          onPressed: () {
            WebViewPageState wps = WebViewPageState()
              ..url = "https://translate.google.cn/"
              ..title = "Google 翻译";
            dispatch(WebViewComponentActionCreator.openWebViewPage(wps));
          },
        ),
      ],
    ),
    body: WebView(
      initialUrl: state.url ?? "",
      javascriptMode: state.javascriptMode,
      navigationDelegate: (NavigationRequest request) {
        return dispatch(WebViewComponentActionCreator.navigationDelegate(request));
      },
      onWebViewCreated: (WebViewController controller) {
        dispatch(WebViewComponentActionCreator.loadWebViewController(controller));
      },
      onPageFinished: (String url) async {
        if (state.webViewController != null) {
          dispatch(WebViewComponentActionCreator.changeTitleEffect());
          bool bk = await state.webViewController.canGoBack() ?? false;
          dispatch(WebViewComponentActionCreator.changeCanGoBack(bk));
        }
      },
    ),
  );
}
