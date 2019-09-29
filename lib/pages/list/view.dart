import 'package:baby_app/components/custom_ui/custom_ui.dart';
import 'package:baby_app/configs/app_config.dart';
import 'package:baby_app/global_store/action.dart';
import 'package:baby_app/global_store/store.dart';
import 'package:baby_app/pages/list/state.dart';
import 'package:baby_app/pages/webview/page.dart';
import 'package:baby_app/pages/webview/state.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;

Widget buildView(ListPageState state, Dispatch dispatch, ViewService viewService) {
  final adapter = viewService.buildAdapter();
  return Scaffold(
    appBar: CustomUI.uResizeNavBarHeight(
        child: AppBar(
      title: Text("测试 DynamicFlowAdapter"),
      elevation: AppConfig.appBarElevation,
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.color_lens),
          onPressed: () {
            GlobalStore.store.dispatch(GlobalActionCreator.changeThemeColor());
//            WebViewPageState wps = WebViewPageState()
//              ..url = "https://translate.google.cn/"
//              ..title = "Google 翻译";
//            Navigator.of(viewService.context).pushReplacementNamed(WebViewPage.routeName,arguments: wps);
          },
        ),
      ],
    )),
    body: Container(
      child: Column(
        children: <Widget>[
          Text("测试 DynamicFlowAdapter=>{${adapter.itemCount}}"),
          Expanded(
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemBuilder: adapter.itemBuilder,
              itemCount: adapter.itemCount,
            ),
          )
        ],
      ),
    ),
  );
}
