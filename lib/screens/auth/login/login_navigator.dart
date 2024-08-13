import 'package:discord/routing/app_navigation.dart';
import 'package:discord/routing/route_name.dart';
import 'package:discord/screens/home/home_navigator.dart';
import 'package:flutter/material.dart';

class LoginNavigator with HomeRoute {
  LoginNavigator(this.navigation);
  @override
  final AppNavigation navigation;
  @override
  late BuildContext context;
}

mixin LoginRoute {
  void goToLogin() {
    navigation.push(context, RouteName.login);
  }

  BuildContext get context;
  AppNavigation get navigation;
}
