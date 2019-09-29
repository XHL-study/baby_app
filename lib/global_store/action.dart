import 'dart:ui';

import 'package:fish_redux/fish_redux.dart';

enum GlobalAction {
  changeThemeColor, //更改主题
}

class GlobalActionCreator {
  static Action changeThemeColor({Color color}) {
    return Action(GlobalAction.changeThemeColor, payload: color);
  }
}
