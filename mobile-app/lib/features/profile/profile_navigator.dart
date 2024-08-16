import 'package:discord/navigation/app_navigation.dart';
import 'package:discord/navigation/route_name.dart';
import 'package:flutter/material.dart';

class ProfileNavigator {}

mixin ProfileRoute {
  void goToProfile() => navigation.push(context, RouteName.profile);
  AppNavigation get navigation;
  BuildContext get context;
}
