import 'package:discord/routing/app_navigation.dart';
import 'package:discord/routing/route_name.dart';

class ProfileNavigator {}

mixin ProfileRoute {
  goToProfile() => navigation.push(RouteName.profile);
  AppNavigation get navigation;
}
