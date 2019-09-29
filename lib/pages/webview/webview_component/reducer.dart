import 'package:baby_app/pages/webview/webview_component/action.dart';
import 'package:baby_app/pages/webview/webview_component/state.dart';
import 'package:fish_redux/fish_redux.dart';

Reducer<WebViewComponentState> buildReducer() {
  return asReducer(<Object, Reducer<WebViewComponentState>>{
    WebViewComponentAction.loadWebViewController: _loadWebViewController,
    WebViewComponentAction.changeTitleReducer: _changeTitleReducer,
    WebViewComponentAction.changeCanGoBack: _changeCanGoBack
  });
}

WebViewComponentState _loadWebViewController(WebViewComponentState state, Action action) {
  return state.clone()..webViewController =action.payload;
}

WebViewComponentState _changeTitleReducer(WebViewComponentState state, Action action) {
  return state.clone()..title = action.payload;
}

WebViewComponentState _changeCanGoBack(WebViewComponentState state, Action action) {
  return state.clone()..canGoBack = action.payload;
}
