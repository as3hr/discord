import 'package:discord/features/auth/login/login_cubit.dart';
import 'package:discord/features/bottom_bar/bottom_bar_navigator.dart';
import 'package:discord/main.dart';
import 'package:discord/navigation/app_navigation.dart';
import 'package:discord/navigation/route_name.dart';
import 'package:flutter/material.dart';

class LoginNavigator with BottomBarRoute {
  LoginNavigator(this.navigation);
  @override
  final AppNavigation navigation;
  @override
  late BuildContext context;
}

mixin LoginRoute {
  void goToLogin() {
    navigation.push(context, RouteName.login,
        arguments: {'loginCubit': getIt<LoginCubit>()});
  }

  BuildContext get context;
  AppNavigation get navigation;
}
