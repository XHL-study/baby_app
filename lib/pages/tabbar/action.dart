import 'package:baby_app/pages/tabbar/state.dart';
import 'package:fish_redux/fish_redux.dart';

enum TabBarPageAction {
  selectTabIndex,
  changePageControllerIndex,
  androidBackDeskTop,
}

class TabBarPageActionCreator {
  static Action selectIndex(int tabIndex) {
    return Action(TabBarPageAction.selectTabIndex, payload: tabIndex);
  }

  static Action androidBackDeskTop() {
    return const Action(TabBarPageAction.androidBackDeskTop);
  }

  static Action changePageControllerIndex(int pageIndex) {
    return Action(TabBarPageAction.changePageControllerIndex, payload: pageIndex);
  }
}
