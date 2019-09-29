import 'dart:ui';

import 'package:baby_app/global_store/state.dart';
import 'package:baby_app/pages/list/normal_component/state.dart';
import 'package:fish_redux/fish_redux.dart';

class ListPageState implements GlobalBaseState, Cloneable<ListPageState> {

  List<NormalComponentState> list = [];

  @override
  Color themeColor;

  @override
  ListPageState clone() {
    return ListPageState()..themeColor = themeColor..list = list;
  }
}

ListPageState initState(ListPageState list){
  return ListPageState();
}