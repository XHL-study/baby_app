import 'package:baby_app/pages/list/adapter/adapter.dart';
import 'package:baby_app/pages/list/effect.dart';
import 'package:baby_app/pages/list/reducer.dart';
import 'package:baby_app/pages/list/state.dart';
import 'package:baby_app/pages/list/view.dart';
import 'package:fish_redux/fish_redux.dart';

class ListPage extends Page<ListPageState, ListPageState> {
  static const String routeName = "listPage";

  ListPage()
      : super(
          view: buildView,
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          dependencies: Dependencies<ListPageState>(
            adapter: NoneConn<ListPageState>() + ListPageAdapter(),
          ),
        );
}
