import 'package:baby_app/pages/tabbar/action.dart';
import 'package:baby_app/pages/webview/page.dart';
import 'package:baby_app/pages/webview/state.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:webview_flutter/webview_flutter.dart';

import 'action.dart';

Effect<WebViewPageState> buildEffect() {
  return combineEffects(<Object, Effect<WebViewPageState>>{
    WebViewPageAction.changeTitleEffect: _changeTitleEffect,
    WebViewPageAction.canPageGoBack: _canPageGoBack,
    WebViewPageAction.pageGoBack: _pageGoBack,
    WebViewPageAction.navigationDelegate: _navigationDelegate,
    WebViewPageAction.openWebViewPage: _openWebViewPage,
    WebViewPageAction.refreshWebPage: _refreshWebPage,
    WebViewPageAction.canPop: _canPop
  });
}

void _changeTitleEffect(Action action, Context<WebViewPageState> ctx) async {
//  final title = await ctx.state.webViewController.evaluateJavascript("document.title");
  final title = await ctx.state.webViewController.getTitle();
  ctx.dispatch(WebViewPageActionCreator.changeTitleReducer(title));
}

void _canPageGoBack(Action action, Context<WebViewPageState> ctx) async {
  WebViewController controller = ctx.state.webViewController;
  final bool canBack = await controller.canGoBack();
  if (canBack)
    controller.goBack();
  else if (action.payload) Navigator.of(ctx.context).pop();
}

void _pageGoBack(Action action, Context<WebViewPageState> ctx) {
  Navigator.of(ctx.context).pop();
}

NavigationDecision _navigationDelegate(Action action, Context<WebViewPageState> ctx) {
  NavigationRequest request = action.payload;
  if (!request.url.startsWith("http")) {
    return NavigationDecision.prevent;
  }
  return NavigationDecision.navigate;
}

void _openWebViewPage(Action action, Context<WebViewPageState> ctx) {
  Navigator.of(ctx.context).pushNamed(WebViewPage.routeName, arguments: action.payload);
}

void _refreshWebPage(Action action, Context<WebViewPageState> ctx) {
  ctx..state.webViewController.reload();
}

bool _canPop(Action action, Context<WebViewPageState> ctx) {
  return Navigator.canPop(ctx.context);
}
