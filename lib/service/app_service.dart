import 'package:discord/data/local_storage/primary_local_storage_repository.dart';
import 'package:discord/data/login/firebase_login_repository.dart';
import 'package:discord/domain/repositories/local_storage_repository.dart';
import 'package:discord/domain/repositories/login_repository.dart';
import 'package:discord/domain/stores/user_store.dart';
import 'package:discord/navigation/app_navigation.dart';
import 'package:discord/features/auth/login/login_navigator.dart';
import 'package:discord/features/splash/splash_navigator.dart';
import 'package:get_it/get_it.dart';

class AppService {
  final GetIt getIt;
  AppService(this.getIt) {
    initialize();
  }
  void initialize() {
    getIt.registerSingleton<AppNavigation>(AppNavigation());
    getIt.registerSingleton<LocalStorageRepository>(
      PrimaryLocalStorageRepository(),
    );
    getIt.registerSingleton<UserStore>(UserStore());
    getIt.registerSingleton<LoginRepository>(FirebaseLoginRepository(getIt()));
    getIt.registerSingleton<LoginNavigator>(LoginNavigator(getIt()));
    getIt.registerSingleton<SplashNavigator>(SplashNavigator(getIt()));
  }
}
