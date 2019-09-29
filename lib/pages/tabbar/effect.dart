import 'package:baby_app/pages/tabbar/action.dart';
import 'package:baby_app/pages/tabbar/state.dart';
import 'package:baby_app/pages/webview/webview_component/state.dart';
import 'package:baby_app/utils/android_back_desktop_util.dart';
import 'package:fish_redux/fish_redux.dart';

Effect<TabBarPageState> buildEffect() {
  return combineEffects(<Object, Effect<TabBarPageState>>{
    TabBarPageAction.androidBackDeskTop: _androidBackDeskTop,
    TabBarPageAction.changePageControllerIndex: _changePageControllerIndex,
  });
}

void _androidBackDeskTop(Action action, Context<TabBarPageState> ctx) {
  AndroidBackDesktopUtil.backDesktop();
}

void _changePageControllerIndex(Action action, Context<TabBarPageState> ctx) {
  ctx.state.pageController.jumpToPage(action.payload);
}

