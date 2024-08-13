import 'package:discord/navigation/app_navigation.dart';
import 'package:discord/features/auth/login/login_navigator.dart';
import 'package:discord/features/home/home_navigator.dart';
import 'package:flutter/material.dart';

class SplashNavigator with LoginRoute, HomeRoute {
  SplashNavigator(this.navigation);
  @override
  AppNavigation navigation;
  @override
  late BuildContext context;
}
