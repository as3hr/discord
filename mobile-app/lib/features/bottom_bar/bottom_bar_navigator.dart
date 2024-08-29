import 'package:discord/navigation/app_navigation.dart';
import 'package:discord/navigation/route_name.dart';
import 'package:flutter/material.dart';

class BottomBarNavigator {}

mixin BottomBarRoute {
  void goToBottomBar() {
    navigation.push(context, RouteName.bottomBar);
  }

  AppNavigation get navigation;
  BuildContext get context;
}
