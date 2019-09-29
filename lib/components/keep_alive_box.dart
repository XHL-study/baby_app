import 'package:flutter/material.dart';

///
/// 页面保持活性
///
class MyKeepAliveBox extends StatefulWidget {
  final Widget body;

  MyKeepAliveBox(this.body);

  @override
  _MyKeepAliveBoxState createState() => _MyKeepAliveBoxState();
}

class _MyKeepAliveBoxState extends State<MyKeepAliveBox> with AutomaticKeepAliveClientMixin<MyKeepAliveBox> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.body;
  }

  @override
  bool get wantKeepAlive => true;
}
