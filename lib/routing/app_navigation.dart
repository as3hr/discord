import 'package:flutter/material.dart';

class AppNavigation {
  static final globalKey = GlobalKey<NavigatorState>();
  static final context = globalKey.currentContext!;

  static void push(String routeName, {Map<String, dynamic>? args}) {
    Navigator.pushNamed(context, routeName, arguments: args);
  }

  static pop() {
    Navigator.pop(context);
  }

  static pushReplacement(String routeName, {Map<String, dynamic>? args}) {
    Navigator.pushReplacementNamed(context, routeName, arguments: args);
  }

  static popAll(String routeName) {
    Navigator.popUntil(context, ModalRoute.withName(routeName));
  }
}
