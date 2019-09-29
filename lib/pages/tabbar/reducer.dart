import 'package:baby_app/pages/tabbar/action.dart';
import 'package:baby_app/pages/tabbar/state.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;

Reducer<TabBarPageState> buildReducer() {
  return asReducer(<Object, Reducer<TabBarPageState>>{
    TabBarPageAction.selectTabIndex: _selectTabIndex,
  });
}

TabBarPageState _selectTabIndex(TabBarPageState state, Action action) {
  return state.clone()..tabIndex = action.payload ?? 0;
}
