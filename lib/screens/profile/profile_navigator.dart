import 'package:discord/routing/app_navigation.dart';
import 'package:discord/routing/route_name.dart';
import 'package:flutter/material.dart';

class ProfileNavigator {}

mixin ProfileRoute {
  goToProfile() => navigation.push(context, RouteName.profile);
  AppNavigation get navigation;
  BuildContext get context;
}
