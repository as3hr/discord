import 'package:discord/features/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:discord/navigation/route_name.dart';

import '../features/auth/login/login_screen.dart';
import '../features/home/home_screen.dart';
import '../features/splash/splash_screen.dart';

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

    case RouteName.home:
      return MaterialPageRoute(builder: (context) => const HomeScreen());

    case RouteName.notification:
      return MaterialPageRoute(builder: (context) => const SplashScreen());

    case RouteName.settings:
      return MaterialPageRoute(builder: (context) => const SplashScreen());

    default:
      return MaterialPageRoute(builder: (context) => const LoginScreen());
  }
}
