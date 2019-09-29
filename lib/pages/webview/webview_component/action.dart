import 'package:baby_app/pages/webview/state.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:webview_flutter/webview_flutter.dart';

enum WebViewComponentAction{
  changeTitleEffect, //改变标题的副作用函数
  changeTitleReducer, //改变标题
  pageGoBack, //直接关闭页面
  canPageGoBack, //返回页面时检测webView的页面是否可以后退。1.如果能后退，则后退webView内的网页 2.如果不能则根据close的值判断是否关闭页面
  loadWebViewController, //获取webView控制器
  navigationDelegate, //是否阻止链接继续加载
  loadUrl, //加载url
  openWebViewPage, //打开新的webView页面
  changeCanGoBack, //当前webViewPage内的网页是否可以返回
}

class WebViewComponentActionCreator{
  static Action changeTitleEffect() {
    return const Action(WebViewComponentAction.changeTitleEffect);
  }

  static Action changeTitleReducer(String title) {
    return Action(WebViewComponentAction.changeTitleReducer, payload: title);
  }

  static Action loadWebViewController(WebViewController controller) {
    return Action(WebViewComponentAction.loadWebViewController, payload: controller);
  }

  static Action canPageGoBack({bool close = true}) {
    return Action(WebViewComponentAction.canPageGoBack, payload: close);
  }

  static Action pageGoBack() {
    return const Action(WebViewComponentAction.pageGoBack);
  }

  static Action navigationDelegate(NavigationRequest request) {
    return Action(WebViewComponentAction.navigationDelegate, payload: request);
  }

  static Action openWebViewPage(WebViewPageState wps) {
    return Action(WebViewComponentAction.openWebViewPage, payload: wps);
  }

  static Action changeCanGoBack(bool canGoBack) {
    return Action(WebViewComponentAction.changeCanGoBack, payload: canGoBack);
  }
}