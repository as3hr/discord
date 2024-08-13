import 'package:flutter/material.dart';

class AppNavigation {
  static final globalKey = GlobalKey<NavigatorState>();
  // final context = globalKey.currentContext!;

  void push(BuildContext context, String routeName,
      {Map<String, dynamic>? args}) {
    Navigator.pushNamed(context, routeName, arguments: args);
  }

  pop(BuildContext context) {
    Navigator.pop(context);
  }

  pushReplacement(BuildContext context, String routeName,
      {Map<String, dynamic>? args}) {
    Navigator.pushReplacementNamed(context, routeName, arguments: args);
  }

  popAll(BuildContext context, String routeName) {
    Navigator.popUntil(context, ModalRoute.withName(routeName));
  }
}
