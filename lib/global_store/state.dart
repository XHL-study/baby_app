import 'package:baby_app/configs/app_config.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class GlobalBaseState {
  Color get themeColor;

  set themeColor(Color color);
}

class GlobalState implements GlobalBaseState, Cloneable<GlobalState> {
  @override
  Color themeColor = AppConfig.themeColor;

  @override
  GlobalState clone() {
    return GlobalState()..themeColor = themeColor;
  }
}
