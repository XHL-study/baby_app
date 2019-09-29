import 'package:baby_app/components/custom_ui/custom_ui.dart';
import 'package:baby_app/configs/app_config.dart';
import 'package:baby_app/global_store/action.dart';
import 'package:baby_app/global_store/store.dart';
import 'package:baby_app/pages/webview/action.dart';
import 'package:baby_app/pages/webview/state.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

///
/// 展示返回按钮
///
Widget buildView(WebViewPageState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    appBar: CustomUI.uResizeNavBarHeight(
      child: AppBar(
        leading: state.canGoBack
            ? IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  dispatch(WebViewPageActionCreator.canPageGoBack(close: false));
                },
              )
            : IconButton(
                icon: Icon(Icons.close),
                onPressed: () async {
                  bool canBack = dispatch(WebViewPageActionCreator.canPop());
                  if (canBack) dispatch(WebViewPageActionCreator.canPageGoBack(close: true));
                },
              ),
        elevation: AppConfig.appBarElevation,
        backgroundColor: state.themeColor,
        title: Text(state.title ?? "没有网络地址"),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                dispatch(WebViewPageActionCreator.refreshWebPage());
              }),
          IconButton(
            icon: Icon(Icons.more_horiz),
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
        key: Key("web_2"),
        initialUrl: state.url ?? "",
        javascriptMode: state.javascriptMode,
        navigationDelegate: (NavigationRequest request) {
          return dispatch(WebViewPageActionCreator.navigationDelegate(request));
        },
        onWebViewCreated: (WebViewController controller) {
          dispatch(WebViewPageActionCreator.loadWebViewController(controller));
        },
        onPageFinished: (String url) async {
          if (state.webViewController != null) {
            dispatch(WebViewPageActionCreator.changeTitleEffect());
            bool bk = await state.webViewController.canGoBack() ?? false;
            dispatch(WebViewPageActionCreator.changeCanGoBack(bk));
          }
        },
      );
    }),
  );
}
