import 'package:baby_app/components/custom_ui/custom_ui.dart';
import 'package:baby_app/pages/list/normal_component/action.dart';
import 'package:baby_app/pages/list/normal_component/state.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' as prefix0;

Effect<NormalComponentState> buildEffect() {
  return combineEffects(<Object, Effect<NormalComponentState>>{
    NormalComponentAction.onRemoveItem: _onRemoveItem,
  });
}

void _onRemoveItem(Action action, Context<NormalComponentState> ctx) async {
  final String res = await CustomUI.uAlert(ctx.context, title: "警告", content: "确认删除该医生吗？");
  if (res == 'yes') {
    prefix0.debugPrint("remove item=>${ctx.state.toString()}");
    ctx.dispatch(NormalComponentActionCreator.removeItem(action.payload));
  }
}
