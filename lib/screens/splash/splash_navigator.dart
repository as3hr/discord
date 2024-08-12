import 'package:discord/routing/app_navigation.dart';
import 'package:discord/screens/auth/login/login_navigator.dart';
import 'package:flutter/material.dart';

class SplashNavigator with LoginRoute {
  SplashNavigator(this.navigation);
  @override
  AppNavigation navigation;

  @override
  late BuildContext context;
}
