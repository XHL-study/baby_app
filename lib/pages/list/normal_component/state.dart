import 'dart:ui';

import 'package:baby_app/global_store/state.dart';
import 'package:fish_redux/fish_redux.dart';

class NormalComponentState implements Cloneable<NormalComponentState> {
  String id;
  String title;
  String icon;
  String introduction;
  int type;
  String date;
  Color themeColor;

  NormalComponentState({this.id, this.title, this.icon, this.introduction, this.type, this.date, this.themeColor});

  @override
  NormalComponentState clone() {
    return NormalComponentState()
      ..id = id
      ..title = title
      ..icon = icon
      ..introduction = introduction
      ..type = type
      ..date = date
      ..themeColor = themeColor;
  }

  @override
  String toString() {
    return "NormalComponentState({id:$id, title:$title, icon:$icon, introduction:$introduction, type:$type, date:$date})";
  }
}
