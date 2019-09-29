import 'dart:math';
import 'dart:ui';

import 'package:baby_app/global_store/action.dart';
import 'package:baby_app/global_store/reducer.dart';
import 'package:baby_app/global_store/state.dart';
import 'package:baby_app/pages/index/page.dart';
import 'package:baby_app/routes/my_router.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;

import 'configs/app_config.dart';

class AppRootPage extends Page<AppRootPageState, AppRootPageState>{
  static const String routeName = "AppRootPage";

  AppRootPage()
      : super(
          initState: initState,
          view: buildView,
          shouldUpdate: (o, n) {
            return o.themeColor != n.themeColor;
          },
        );
}

class AppFulPageActionCreator {
  static Action changeThemeColor() {
    return const Action(GlobalAction.changeThemeColor);
  }
}

//Reducer<AppRootPageState> buildReducer() {
//  return asReducer(<Object, Reducer<AppRootPageState>>{GlobalAction.changeThemeColor: _changeThemeColor});
//}
//
//AppRootPageState _changeThemeColor(AppRootPageState state, Action action) {
//  return state.clone()..themeColor = colorList[Random().nextInt(colorList.length)];
//}

Widget buildView(AppRootPageState state, Dispatch dispatch, ViewService viewService) {
  return MaterialApp(
    title: AppConfig.appTitle,
    theme: ThemeData(
      primaryColor: state.themeColor,
    ),
    color: state.themeColor,
    home: MyRouter.routes.buildPage(IndexPage.routeName, null),
    onGenerateRoute: (RouteSettings settings) {
      return MaterialPageRoute<Object>(builder: (BuildContext context) {
        return MyRouter.routes.buildPage(settings.name, settings.arguments);
      });
    },
  );
}

class AppRootPageState implements GlobalBaseState, Cloneable<AppRootPageState> {
  @override
  Color themeColor;

  @override
  clone() {
    return AppRootPageState()..themeColor = themeColor;
  }
}

AppRootPageState initState(AppRootPageState state) {
  return AppRootPageState();
}
