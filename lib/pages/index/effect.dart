import 'dart:async';

import 'package:baby_app/components/custom_ui/custom_ui.dart';
import 'package:baby_app/global_store/action.dart';
import 'package:baby_app/global_store/store.dart';
import 'package:baby_app/pages/index/action.dart';
import 'package:baby_app/pages/index/state.dart';
import 'package:baby_app/pages/tabbar/page.dart';
import 'package:baby_app/pages/webview/page.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;

Effect<IndexPageState> buildEffect() {
  return combineEffects(<Object, Effect<IndexPageState>>{
    Lifecycle.initState: _init,
    IndexPageAction.onChangeTheme: _onChangeTheme,
    IndexPageAction.openWebViewPage: _openWebViewPage,
    IndexPageAction.openTabBarPage: _openTabBarPage,
    IndexPageAction.openPage: _openPage,
  });
}


void _init(Action action, Context<IndexPageState> ctx) {
  new Timer(const Duration(), () async {
    final res = await CustomUI.uAlert(ctx.context, content: "我是弹出框");

    if (res == 'yes')
      print("选择了确认");
    else {
      print("选择了取消");
    }
  });
}

void _onChangeTheme(Action action, Context<IndexPageState> ctx) {
  GlobalStore.store.dispatch(GlobalActionCreator.changeThemeColor(color: action.payload));
}

void _openWebViewPage(Action action, Context<IndexPageState> ctx) {
  Navigator.of(ctx.context).pushNamed(WebViewPage.routeName, arguments: action.payload);
}

void _openTabBarPage(Action action, Context<IndexPageState> ctx) {
//  Navigator.of(ctx.context).pushReplacementNamed(TabBarPage.routeName,arguments: action.payload);
  Navigator.pushNamed(ctx.context, TabBarPage.routeName, arguments: action.payload);
}

void _openPage(Action action, Context<IndexPageState> ctx) {
  final OpenPageEntity ope = action.payload;
  Navigator.pushNamed(ctx.context, ope.routeName, arguments: ope.data);
}
