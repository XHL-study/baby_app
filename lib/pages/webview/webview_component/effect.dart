
import 'package:baby_app/pages/webview/webview_component/state.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:webview_flutter/webview_flutter.dart';

import '../page.dart';
import 'action.dart';

Effect<WebViewComponentState> buildEffect(){
  return combineEffects(<Object,Effect<WebViewComponentState>>{
    WebViewComponentAction.changeTitleEffect: _changeTitleEffect,
    WebViewComponentAction.canPageGoBack: _canPageGoBack,
    WebViewComponentAction.pageGoBack: _pageGoBack,
    WebViewComponentAction.navigationDelegate: _navigationDelegate,
    WebViewComponentAction.openWebViewPage: _openWebViewPage,
  });
}
void _changeTitleEffect(Action action, Context<WebViewComponentState> ctx) async {
  final title = await ctx.state.webViewController.evaluateJavascript("document.title");
  ctx.dispatch(WebViewComponentActionCreator.changeTitleReducer(title.replaceAll('"', "")));
}

void _canPageGoBack(Action action, Context<WebViewComponentState> ctx) async {
  WebViewController controller = ctx.state.webViewController;
  final bool canBack = await controller.canGoBack();
  if (canBack)
    controller.goBack();
  else if (action.payload) Navigator.of(ctx.context).pop();
}

void _pageGoBack(Action action, Context<WebViewComponentState> ctx) {
  Navigator.of(ctx.context).pop();
}

NavigationDecision _navigationDelegate(Action action, Context<WebViewComponentState> ctx) {
  NavigationRequest request = action.payload;
  if (!request.url.startsWith("http")) {
    return NavigationDecision.prevent;
  }
  return NavigationDecision.navigate;
}

void _openWebViewPage(Action action, Context<WebViewComponentState> ctx) {
  Navigator.of(ctx.context).pushNamed(WebViewPage.routeName, arguments: action.payload);
}