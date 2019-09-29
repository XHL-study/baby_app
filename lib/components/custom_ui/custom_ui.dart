import 'package:baby_app/configs/app_config.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

class CustomUI {
  ///输入框
  static Widget uInput(
    TextEditingController tCtl,
    FocusNode focusNode, {
    String placeholder = "",
    IconData prefix = Icons.account_box,
    IconData suffix = Icons.clear,
    double height = 55.0,
    double borderWidth = 0.4,
    double borderRadius = 55.0,
    double cursorWidth = 3.0,
    double paddingLR = 10.0,
    EdgeInsetsGeometry margin = const EdgeInsets.all(0),
    double iconSize = 22.0,
    Color borderColor = Colors.grey,
    Color prefixIconColor = Colors.grey,
    Color suffixIconColor = Colors.grey,
    Color cursorColor = Colors.grey,
    Color bgColor = Colors.white,
    Color textColor = Colors.red,
    Color placeholderColor = Colors.grey,
    bool isPassword = false,
    bool showFocusBorder = false,
  }) {
    BorderRadius _radius = BorderRadius.all(Radius.circular(borderRadius));
    EdgeInsets _edgeInsets = EdgeInsets.fromLTRB(paddingLR, 0, paddingLR, 0);

    return Container(
      key: GlobalKey(),
      height: height,
      padding: _edgeInsets,
      margin: margin,
      decoration: BoxDecoration(
        border: borderWidth <= 0 ? null : Border.all(color: borderColor, width: borderWidth, style: BorderStyle.solid),
        borderRadius: _radius,
        color: bgColor,
      ),
      child: Row(
        children: <Widget>[
          Icon(prefix, color: prefixIconColor, size: iconSize),
          Expanded(
            child: Padding(
              padding: _edgeInsets,
              child: TextField(
                controller: tCtl,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: placeholder,
                  hintStyle: TextStyle(color: placeholderColor),
                ),
                style: TextStyle(color: textColor),
                cursorColor: cursorColor,
                cursorWidth: cursorWidth,
                obscureText: isPassword,
              ),
            ),
            flex: 1,
          ),
          Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
              child: Icon(
                suffix,
                color: suffixIconColor,
                size: iconSize,
              ),
              onTap: () {
                tCtl?.clear();
              },
            ),
          )
        ],
      ),
    );
  }

  ///设置导航栏高度
  static Widget uResizeNavBarHeight({
    Widget child,
    double height = AppConfig.appBarHeight,
  }) {
    return PreferredSize(child: child, preferredSize: Size.fromHeight(height));
  }

  ///弹出框 - 确认框
  ///返回值：yes,no
  static Future<String> uAlert(
    BuildContext ctx, {
    String title = "提示",
    String content = "",
    String cancelText = "取消",
    String confirmText = "确认",
    Color cancelTextColor = Colors.white,
    Color cancelBgColor,
    Color confirmTextColor = Colors.white,
    Color confirmBgColor,
  }) async {
    cancelBgColor = cancelBgColor ?? Theme.of(ctx).primaryColor;
    confirmBgColor = confirmBgColor ?? cancelBgColor;

    return await showDialog<String>(
        context: ctx,
        builder: (BuildContext buildContext) {
          return SafeArea(
              child: AlertDialog(
            titlePadding: EdgeInsets.all(8.0),
            contentPadding: EdgeInsets.all(8.0),
            title: Text(title),
            content: Container(
              child: Text(content),
            ),
            actions: <Widget>[
              RaisedButton(
                elevation: 0,
                color: cancelBgColor,
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.cancel,
                      color: confirmTextColor,
                    ),
                    Text(cancelText, style: TextStyle(color: cancelTextColor)),
                  ],
                ),
                onPressed: () {
                  Navigator.of(buildContext).pop('no');
                },
              ),
              RaisedButton(
                elevation: 0,
                color: confirmBgColor,
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.subdirectory_arrow_left,
                      color: confirmTextColor,
                    ),
                    Text(confirmText, style: TextStyle(color: confirmTextColor)),
                  ],
                ),
                onPressed: () {
                  Navigator.of(buildContext).pop('yes');
                },
              ),
            ],
          ));
        });
  }
}
