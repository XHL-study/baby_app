import 'package:baby_app/configs/app_config.dart';
import 'package:baby_app/pages/index/page.dart';
import 'package:baby_app/routes/my_router.dart';
import 'package:flutter/material.dart' hide Action;

Widget createApp() {
  return MaterialApp(
    title: AppConfig.appTitle,
    theme: ThemeData(primaryColor: AppConfig.themeColor),
    home: MyRouter.routes.buildPage(IndexPage.routeName, null),
    onGenerateRoute: (RouteSettings settings) {
      return MaterialPageRoute<Object>(builder: (BuildContext context) {
        return MyRouter.routes.buildPage(settings.name, settings.arguments);
      });
    },
  );
}