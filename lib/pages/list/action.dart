import 'package:baby_app/pages/list/normal_component/state.dart';
import 'package:fish_redux/fish_redux.dart';

enum ListAction { initData }

class ListActionCreator {
  static Action initData(List<NormalComponentState> list) {
    return Action(ListAction.initData, payload: list);
  }
}
