import 'package:discord/features/bottom_bar/bottom_bar_cubit.dart';
import 'package:discord/main.dart';
import 'package:discord/navigation/app_navigation.dart';
import 'package:discord/navigation/route_name.dart';
import 'package:flutter/material.dart';

class BottomBarNavigator {}

mixin BottomBarRoute {
  void goToBottomBar() {
    navigation.push(context, RouteName.bottomBar,
        arguments: {'bottomBarCubit': getIt<BottomBarCubit>()});
  }

  AppNavigation get navigation;
  BuildContext get context;
}
