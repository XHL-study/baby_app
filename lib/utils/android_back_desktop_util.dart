import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

///
/// back desktop
///
class AndroidBackDesktopUtil {
  ///channel name
  static const String chanel = "android.back.desktop";

  ///back desktop event name
  static const String eventBackDesktop = "backdesktop";

  ///back desktop event
  static Future<bool> backDesktop() async {
    final platform = MethodChannel(chanel);
    try {
      return await platform.invokeMethod(eventBackDesktop);
    } on PlatformException catch (e) {
      debugPrint(e.toString());
    }
    return Future.value(false);
  }
}
