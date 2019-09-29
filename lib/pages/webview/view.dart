import 'package:baby_app/components/custom_ui/custom_ui.dart';
import 'package:baby_app/configs/app_config.dart';
import 'package:baby_app/pages/webview/action.dart';
import 'package:baby_app/pages/webview/state.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

Widget buildView(WebViewPageState state, Dispatch dispatch, ViewService viewService) {
  return WillPopScope(
    onWillPop: () {
      dispatch(WebViewPageActionCreator.canPageGoBack());
      return Future.value(false);
    },
    child: Scaffold(
      appBar: CustomUI.uResizeNavBarHeight(
        child: AppBar(
          elevation: AppConfig.appBarElevation,
          backgroundColor: state.themeColor,
          title: Text(state?.title ?? "没有网络地址"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.web),
              onPressed: () {
                WebViewPageState wps = WebViewPageState()
                  ..url = "https://translate.google.cn/"
                  ..title = "Google 翻译";
                dispatch(WebViewPageActionCreator.openWebViewPage(wps));
              },
            ),
          ],
        ),
      ),
      body: Builder(builder: (BuildContext context) {
        return WebView(
          key: Key("web_1"),
          initialUrl: state.url ?? "",
          javascriptMode: state.javascriptMode,
          navigationDelegate: (NavigationRequest request) {
            return dispatch(WebViewPageActionCreator.navigationDelegate(request));
          },
          onWebViewCreated: (WebViewController controller) {
            dispatch(WebViewPageActionCreator.loadWebViewController(controller));
          },
          onPageFinished: (String url) {
            dispatch(WebViewPageActionCreator.changeTitleEffect());
          },
        );
      }),
    ),
  );
}
