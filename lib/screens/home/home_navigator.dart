import 'package:discord/routing/app_navigation.dart';
import 'package:discord/routing/route_name.dart';
import 'package:flutter/widgets.dart';

class HomeNavigator {}

mixin HomeRoute {
  void goToHome() => navigation.push(context, RouteName.home);
  AppNavigation get navigation;
  BuildContext get context;
}
