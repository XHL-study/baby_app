import 'package:baby_app/app_root_page.dart';
import 'package:baby_app/configs/app_config.dart';
import 'package:baby_app/global_store/state.dart';
import 'package:baby_app/global_store/store.dart';
import 'package:baby_app/pages/index/page.dart';
import 'package:baby_app/pages/list/page.dart';
import 'package:baby_app/pages/tabbar/page.dart';
import 'package:baby_app/pages/webview/page.dart';
import 'package:baby_app/pages/webview/page_back_btn.dart';
import 'package:fish_redux/fish_redux.dart';

//路由
class MyRouter {
  //路由集合
  static final Map<String, Page<Object, dynamic>> _routes = {
    AppRootPage.routeName: AppRootPage(),
    IndexPage.routeName: IndexPage(),
    TabBarPage.routeName: TabBarPage(),
    WebViewPage.routeName: WebViewPage(),
    WebViewPageBack.routeName: WebViewPageBack(),
    ListPage.routeName: ListPage(),
  };

  //路由管理
  static final AbstractRoutes routes = PageRoutes(
    pages: _routes,
    visitor: (String path, Page<Object, dynamic> page) {
      /// 只有特定范围的Page才需要建立和AppStore的连接关系
      if (page.isTypeof<GlobalBaseState>()) {
        page.connectExtraStore<GlobalState>(
          GlobalStore.store,
          (Object pageState, GlobalState appState) {
            final GlobalBaseState p = pageState;
            //更改主题
            if (p.themeColor != appState.themeColor) {
              if (pageState is Cloneable) {
                final Object copy = pageState.clone();
                final GlobalBaseState newState = copy;
                newState.themeColor = appState.themeColor;
                return newState;
              }
            }

            ///初始化主题
//            if (p.themeColor == null) {
//              if (pageState is Cloneable) {
//                final Object copy = pageState.clone();
//                final GlobalBaseState newState = copy;
//                newState.themeColor = appState.themeColor ?? AppConfig.themeColor;
//                return newState;
//              }
//            }
            return p;
          },
        );
      }

      page.enhancer.append(
        /// View AOP
        viewMiddleware: <ViewMiddleware<dynamic>>[
          safetyView<dynamic>(),
        ],

        /// Adapter AOP
        adapterMiddleware: <AdapterMiddleware<dynamic>>[safetyAdapter<dynamic>()],

        /// Effect AOP
        effectMiddleware: [
          _pageAnalyticsMiddleware<dynamic>(),
        ],

        /// Store AOP
        middleware: <Middleware<dynamic>>[
          logMiddleware<dynamic>(tag: page.runtimeType.toString()),
        ],
      );
    },
  );
}

/// 简单的Effect AOP
/// 只针对页面的生命周期进行打印
EffectMiddleware<T> _pageAnalyticsMiddleware<T>({String tag = 'redux'}) {
  return (AbstractLogic<dynamic> logic, Store<T> store) {
    return (Effect<dynamic> effect) {
      return (Action action, Context<dynamic> ctx) {
        if (logic is Page<dynamic, dynamic> && action.type is Lifecycle) {
          print('${logic.runtimeType} <-> ${action.type.toString()} ');
        }
        return effect?.call(action, ctx);
      };
    };
  };
}
