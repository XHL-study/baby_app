import 'dart:io';

import 'package:baby_app/app_root_page.dart';
import 'package:baby_app/routes/my_router.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';

void main() {
  //  runApp(createApp());
  runApp(MyRouter.routes.buildPage(AppRootPage.routeName, null));
  //去掉状态栏的深色背景
  if (Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    //全屏
    //SystemChrome.setEnabledSystemUIOverlays([]);
  }
}
