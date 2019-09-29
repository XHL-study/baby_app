import 'dart:math';

import 'package:baby_app/pages/list/action.dart';
import 'package:baby_app/pages/list/normal_component/state.dart';
import 'package:baby_app/pages/list/state.dart';
import 'package:fish_redux/fish_redux.dart';

Effect<ListPageState> buildEffect() {
  return combineEffects(<Object, Effect<ListPageState>>{Lifecycle.initState: _initList});
}

void _initList(Action action, Context<ListPageState> ctx) {
  final imgList = [
    "https://axure-file.lanhuapp.com/51d4ee7f-3a52-4abc-858b-1e4830d8a449__971f2b133fbcfdbb0d2a46bacb9ded46",
    "https://img.ivsky.com/img/tupian/pre/201901/25/shanyang.jpg",
    "https://img.ivsky.com/img/tupian/pre/201901/25/shanyang-001.jpg",
    "https://img.ivsky.com/img/tupian/pre/201901/25/shanyang-002.jpg",
    "https://img.ivsky.com/img/tupian/pre/201901/25/shanyang-003.jpg",
    "https://img.ivsky.com/img/tupian/pre/201901/25/shanyang-005.jpg",
    "https://img.ivsky.com/img/tupian/pre/201901/25/shanyang-006.jpg",
    "https://img.ivsky.com/img/tupian/pre/201901/25/shanyang-007.jpg",
    "https://img.ivsky.com/img/tupian/pre/201901/25/shanyang-008.jpg",
    "https://img.ivsky.com/img/tupian/pre/201901/25/shanyang-009.jpg",
  ];
  final List<NormalComponentState> list = List.generate(2000, (int index) {
    return NormalComponentState(
      id: "id_$index",
      icon: imgList[Random().nextInt(imgList.length) % imgList.length],
      introduction: "测试demo",
      title: "test$index",
      type: 0,
      date: "2019-09-23 14:07",
    );
  });
  ctx.dispatch(ListActionCreator.initData(list));
}
