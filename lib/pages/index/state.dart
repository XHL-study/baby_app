import 'dart:ui';

import 'package:baby_app/global_store/state.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

class IndexPageState implements GlobalBaseState, Cloneable<IndexPageState> {
  TextEditingController oneCtl;
  TextEditingController twoCtl;

  @override
  Color themeColor;

  @override
  IndexPageState clone() {
    return IndexPageState()
      ..themeColor = themeColor
      ..oneCtl = oneCtl
      ..twoCtl = twoCtl;
  }
}

IndexPageState initState(Map<String, dynamic> args) {
  return IndexPageState()
    ..oneCtl = new TextEditingController()
    ..twoCtl = new TextEditingController();
}
