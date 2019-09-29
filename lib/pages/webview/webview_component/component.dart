import 'package:baby_app/components/keep_alive_box.dart';
import 'package:baby_app/pages/webview/webview_component/state.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';

import 'effect.dart';
import 'reducer.dart';
import 'view.dart';

///
/// 此component写废了，哇 😭😭😭😭😭😭
///
class WebViewComponent extends Component<WebViewComponentState> {
  static const componentName = "WebViewComponent";

  WebViewComponent()
      : super(
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          key: (WebViewComponentState s) {
            return Key(s.key);
          },
          wrapper: (Widget widget) {
            return MyKeepAliveBox(widget);
          },
        );
}
