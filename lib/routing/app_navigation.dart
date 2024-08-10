import 'package:flutter/material.dart';

class AppNavigation {
  static final globalKey = GlobalKey<NavigatorState>();
  final context = globalKey.currentContext!;

  void push(String routeName, {Map<String, dynamic>? args}) {
    Navigator.pushNamed(context, routeName, arguments: args);
  }

  pop() {
    Navigator.pop(context);
  }

  pushReplacement(String routeName, {Map<String, dynamic>? args}) {
    Navigator.pushReplacementNamed(context, routeName, arguments: args);
  }

  popAll(String routeName) {
    Navigator.popUntil(context, ModalRoute.withName(routeName));
  }
}
