import 'package:fish_redux/fish_redux.dart';

enum NormalComponentAction { onRemoveItem, removeItem }

class NormalComponentActionCreator {
  static Action removeItem(String id) {
    return Action(NormalComponentAction.removeItem, payload: id);
  }

  static Action onRemoveItem(String id) {
    return Action(NormalComponentAction.onRemoveItem, payload: id);
  }
}
