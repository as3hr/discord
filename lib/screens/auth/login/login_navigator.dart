import 'package:discord/routing/app_navigation.dart';
import 'package:discord/routing/route_name.dart';
import 'package:discord/screens/home/home_navigator.dart';
import 'package:flutter/material.dart';

class LoginNavigator with HomeRoute {
  @override
  final AppNavigation navigation;
  @override
  late BuildContext context;
  LoginNavigator(this.navigation);
}

mixin LoginRoute {
  goToLogin() {
    navigation.push(context, RouteName.login);
  }

  BuildContext get context;
  AppNavigation get navigation;
}
