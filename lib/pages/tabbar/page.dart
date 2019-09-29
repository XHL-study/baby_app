import 'package:baby_app/components/keep_alive_box.dart';
import 'package:baby_app/pages/tabbar/effect.dart';
import 'package:baby_app/pages/tabbar/reducer.dart';
import 'package:baby_app/pages/tabbar/state.dart';
import 'package:baby_app/pages/tabbar/view.dart';
import 'package:baby_app/pages/webview/webview_component/component.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

class TabBarPage extends Page<TabBarPageState, TabBarPageState> {
  static const String routeName = "tabBarPage";

  TabBarPage()
      : super(
          initState: initState,
          reducer: buildReducer(),
          effect: buildEffect(),
          view: buildView,
          wrapper: (Widget widget) {
            return MyKeepAliveBox(widget);
          },
        );
}
