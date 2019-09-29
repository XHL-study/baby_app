import 'package:baby_app/global_store/reducer.dart';
import 'package:baby_app/global_store/state.dart';
import 'package:fish_redux/fish_redux.dart';

///
/// 全局store
///

class GlobalStore {
  static Store<GlobalState> _globalStore;

  static Store<GlobalState> get store => _globalStore ??= createStore<GlobalState>(GlobalState(), buildReducer());
}
