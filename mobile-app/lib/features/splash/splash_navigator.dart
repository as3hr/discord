import 'package:discord/features/auth/auth_navigator.dart';
import 'package:discord/features/bottom_bar/bottom_bar_navigator.dart';
import 'package:discord/navigation/app_navigation.dart';
import 'package:flutter/material.dart';

class SplashNavigator with AuthRoute, BottomBarRoute {
  SplashNavigator(this.navigation);
  @override
  AppNavigation navigation;
  @override
  late BuildContext context;
}
