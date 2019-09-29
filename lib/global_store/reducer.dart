import 'dart:ui';

import 'package:baby_app/global_store/action.dart';
import 'package:baby_app/global_store/state.dart';
import 'package:baby_app/utils/common_util.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;

Reducer<GlobalState> buildReducer() {
  return asReducer(
    <Object, Reducer<GlobalState>>{
      GlobalAction.changeThemeColor: _changeThemeColor,
    },
  );
}

//const List<Color> colorList = <Color>[
//  Colors.green,
//  Colors.red,
//  Colors.purple,
//  Colors.blueAccent,
//];

GlobalState _changeThemeColor(GlobalState state, Action action) {
  if (action?.payload is Color) {
    return state.clone()..themeColor = action.payload;
  }
  return state.clone()
    ..themeColor = Color.fromARGB(255,CommonUtil.randomInt(255), CommonUtil.randomInt(255), CommonUtil.randomInt(255));
//  return state.clone()..themeColor = _colorList[Random().nextInt(_colorList.length)];
}

