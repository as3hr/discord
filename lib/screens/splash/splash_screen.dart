import 'package:flutter/material.dart';

import '../../routing/app_navigation.dart';
import '../../routing/route_name.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2),
        () => AppNavigation.pushReplacement(RouteName.login));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
