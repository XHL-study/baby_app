import 'dart:ui';

import 'package:baby_app/configs/app_config.dart';
import 'package:baby_app/global_store/action.dart';
import 'package:baby_app/global_store/store.dart';
import 'package:baby_app/pages/tabbar/action.dart';
import 'package:baby_app/pages/tabbar/state.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;

Widget buildView(TabBarPageState state, Dispatch dispatch, ViewService viewService) {
  return WillPopScope(
    onWillPop: () {
      if (state.androidBackDesktop) {
        dispatch(TabBarPageActionCreator.androidBackDeskTop());
      } else {
        return Future.value(true);
      }
      return Future.value(false);
    },
    child: Scaffold(
      body: Stack(
        children: <Widget>[
          PageView.builder(
              pageSnapping: true,
              //是否整页滚动
              controller: state.pageController,
              physics: NeverScrollableScrollPhysics(),
              itemCount: state.tabLen,
              onPageChanged: (index) {
                dispatch(TabBarPageActionCreator.selectIndex(index));
              },
              itemBuilder: (context, index) {
                return state.tabList[index];
              }),
          Positioned(
            top: MediaQueryData.fromWindow(window).padding.top,
            left: 200,
            child: FlatButton(
              onPressed: () {
                GlobalStore.store.dispatch(GlobalActionCreator.changeThemeColor());
              },
              child: Text("更改主题"),
            ),
          )
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            border: Border(
                top: BorderSide(
          width: .2,
          color: Colors.grey,
          style: BorderStyle.solid,
        ))),
        child: BottomNavigationBar(
          elevation: AppConfig.appBarElevation,
          onTap: (int index) {
            dispatch(TabBarPageActionCreator.selectIndex(index));
            dispatch(TabBarPageActionCreator.changePageControllerIndex(index));
          },
          type: BottomNavigationBarType.fixed,
          currentIndex: state.tabIndex,
          selectedItemColor: state.themeColor,
          items: state.tabs.map<BottomNavigationBarItem>((TabBarItem m) {
            return BottomNavigationBarItem(
              title: Text(
                m.title,
              ),
              icon: Icon(m.icon),
            );
          }).toList(),
        ),
      ),
    ),
  );
}
