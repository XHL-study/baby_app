import 'package:baby_app/pages/list/normal_component/action.dart';
import 'package:baby_app/pages/list/normal_component/state.dart';
import 'package:baby_app/pages/list/state.dart';
import 'package:fish_redux/fish_redux.dart';

Reducer<ListPageState> buildReducer() {
  return asReducer(<Object, Reducer<ListPageState>>{
    NormalComponentAction.removeItem: _removeItem,
  });
}

ListPageState _removeItem(ListPageState state, Action action) {
  final String id = action.payload;
  final ListPageState lps = state.clone();
  lps.list.removeWhere((NormalComponentState ncs) {
    return ncs.id == id;
  });
  return lps;
}
