import 'package:discord/data/login/firebase_login_repository.dart';
import 'package:discord/domain/repositories/login_repository.dart';
import 'package:discord/routing/app_navigation.dart';
import 'package:discord/screens/auth/login/login_navigator.dart';
import 'package:get_it/get_it.dart';

class AppService {
  final GetIt getIt;
  AppService(this.getIt) {
    initialize();
  }
  void initialize() {
    getIt.registerSingleton<AppNavigation>(AppNavigation());
    getIt.registerSingleton<LoginRepository>(FirebaseLoginRepository());
    getIt.registerSingleton<LoginNavigator>(LoginNavigator(getIt()));
  }
}
