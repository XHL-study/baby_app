import 'package:baby_app/pages/list/adapter/reducer.dart';
import 'package:baby_app/pages/list/normal_component/component.dart';
import 'package:baby_app/pages/list/normal_component/state.dart';
import 'package:baby_app/pages/list/state.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';

class ListPageAdapter extends DynamicFlowAdapter<ListPageState> {
  ListPageAdapter()
      : super(
          pool: <String, Component<Object>>{
            NormalComponent.componentName: NormalComponent(),
          },
          connector: _ListAdapterConnector(),
          reducer: buildReducer(),
        );
}

class _ListAdapterConnector extends ConnOp<ListPageState, List<ItemBean>> {
//  int i = 0,j=0;
  @override
  List<ItemBean> get(ListPageState state) {
//    j++;
    if (state.list.isNotEmpty == true) {
      return state.list.map<ItemBean>((NormalComponentState ncs) {
//        debugPrint("i=${i++},j=$j");
        return ItemBean(NormalComponent.componentName, ncs.clone()..themeColor=state.themeColor);
      }).toList(growable: true);
    } else
      return <ItemBean>[];
  }

  @override
  void set(ListPageState state, List<ItemBean> subState) {
    if (subState?.isNotEmpty == true) {
      state.list = List<NormalComponentState>.from(subState.map<NormalComponentState>((ItemBean b) => b.data));
    } else
      state.list = <NormalComponentState>[];
  }
}
