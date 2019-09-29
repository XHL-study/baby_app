import 'package:baby_app/pages/webview/action.dart';
import 'package:baby_app/pages/webview/state.dart';
import 'package:fish_redux/fish_redux.dart';

Reducer<WebViewPageState> buildReducer() {
  return asReducer(<Object, Reducer<WebViewPageState>>{
    WebViewPageAction.loadWebViewController: _loadWebViewController,
    WebViewPageAction.changeTitleReducer: _changeTitleReducer,
    WebViewPageAction.changeCanGoBack: _changeCanGoBack
  });
}

WebViewPageState _loadWebViewController(WebViewPageState state, Action action) {
  final WebViewPageState newState = state.clone();
  newState.webViewController = action.payload;
  return newState;
}

WebViewPageState _changeTitleReducer(WebViewPageState state, Action action) {
  final WebViewPageState newState = state.clone();
  newState.title = action.payload;
  return newState;
}

WebViewPageState _changeCanGoBack(WebViewPageState state, Action action) {
  return state.clone()..canGoBack = action.payload;
}
