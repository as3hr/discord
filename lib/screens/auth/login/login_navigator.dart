import 'package:discord/routing/app_navigation.dart';
import 'package:discord/routing/route_name.dart';
import 'package:discord/screens/profile/profile_navigator.dart';

class LoginNavigator with ProfileRoute {
  @override
  final AppNavigation navigation;
  LoginNavigator(this.navigation);
}

mixin LoginRoute {
  goToLogin() {
    navigation.push(RouteName.login);
  }

  AppNavigation get navigation;
}
