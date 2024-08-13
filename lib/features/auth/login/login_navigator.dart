import 'package:discord/main.dart';
import 'package:discord/navigation/app_navigation.dart';
import 'package:discord/navigation/route_name.dart';
import 'package:discord/features/home/home_navigator.dart';
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
    navigation.push(context, RouteName.login, args: {'loginCubit': getIt()});
  }

  BuildContext get context;
  AppNavigation get navigation;
}
