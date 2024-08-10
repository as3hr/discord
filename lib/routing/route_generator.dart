import 'package:discord/screens/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:discord/routing/route_name.dart';

import '../screens/auth/login/login_screen.dart';
import '../screens/splash/splash_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  // final args = settings.arguments as Map<String, dynamic>;
  switch (settings.name) {
    case RouteName.splash:
      return MaterialPageRoute(builder: (context) => const SplashScreen());

    case RouteName.login:
      return MaterialPageRoute(builder: (context) => const LoginScreen());

    case RouteName.register:
      return MaterialPageRoute(builder: (context) => const SplashScreen());

    case RouteName.profile:
      return MaterialPageRoute(builder: (context) => const ProfileScreen());

    case RouteName.notification:
      return MaterialPageRoute(builder: (context) => const SplashScreen());

    case RouteName.settings:
      return MaterialPageRoute(builder: (context) => const SplashScreen());

    default:
      return MaterialPageRoute(builder: (context) => const LoginScreen());
  }
}
