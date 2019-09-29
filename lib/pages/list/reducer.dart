import 'package:baby_app/pages/list/action.dart';
import 'package:baby_app/pages/list/normal_component/state.dart';
import 'package:baby_app/pages/list/state.dart';
import 'package:fish_redux/fish_redux.dart';

Reducer<ListPageState> buildReducer() {
  return asReducer(<Object, Reducer<ListPageState>>{ListAction.initData: _initData});
}

ListPageState _initData(ListPageState state, Action action) {
  return state
    ..clone()
    ..list = action.payload ?? <NormalComponentState>[];
}
