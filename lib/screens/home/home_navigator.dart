import 'package:discord/routing/app_navigation.dart';
import 'package:discord/routing/route_name.dart';
import 'package:flutter/material.dart';

class HomeNavigator {}

mixin HomeRoute {
  goToHome() => navigation.push(context, RouteName.home);
  AppNavigation get navigation;
  BuildContext get context;
}
