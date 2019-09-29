import 'package:baby_app/pages/index/effect.dart';
import 'package:baby_app/pages/index/reducer.dart';
import 'package:baby_app/pages/index/state.dart';
import 'package:baby_app/pages/index/view.dart';
import 'package:fish_redux/fish_redux.dart';

///
/// 首页
///
class IndexPage extends Page<IndexPageState, Map<String, dynamic>> {
  static const String routeName = "index";

  IndexPage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
        );

///// 页面私有AOP, 如果需要
//// middleware: <Middleware<PageState>>[
////   logMiddleware(tag: 'ToDoListPage'),
//// ],
}
