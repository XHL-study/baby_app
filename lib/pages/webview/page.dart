import 'package:baby_app/components/keep_alive_box.dart';
import 'package:baby_app/pages/webview/effect.dart';
import 'package:baby_app/pages/webview/reducer.dart';
import 'package:baby_app/pages/webview/state.dart';
import 'package:baby_app/pages/webview/view.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;

class WebViewPage extends Page<WebViewPageState, WebViewPageState> {
  static const routeName = "WebViewPage";

  WebViewPage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
//          wrapper: (Widget widget) {
//            return MyKeepAliveBox(widget);
//          },
//          dependencies: Dependencies<WebViewPageState>(slots: <String, Dependent<WebViewPageState>>{
//            'report': ReportComponent(),
//          }),
        );
}
