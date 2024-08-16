import 'package:discord/data/auth/api_auth_repository.dart';
import 'package:discord/data/local_storage/primary_local_storage_repository.dart';
import 'package:discord/domain/repositories/auth_repository.dart';
import 'package:discord/domain/repositories/local_storage_repository.dart';
import 'package:discord/domain/stores/user_store.dart';
import 'package:discord/features/auth/auth_cubit.dart';
import 'package:discord/features/auth/auth_navigator.dart';
import 'package:discord/features/bottom_bar/bottom_bar_cubit.dart';
import 'package:discord/features/bottom_bar/bottom_bar_navigator.dart';
import 'package:discord/features/home/home_cubit.dart';
import 'package:discord/features/splash/splash_cubit.dart';
import 'package:discord/navigation/app_navigation.dart';
import 'package:discord/features/splash/splash_navigator.dart';
import 'package:get_it/get_it.dart';

class AppService {
  static Future<void> initialize(GetIt getIt) async {
    getIt.registerSingleton<AppNavigation>(AppNavigation());
    getIt.registerSingleton<HomeCubit>(HomeCubit());
    getIt.registerSingleton<LocalStorageRepository>(
      PrimaryLocalStorageRepository(),
    );
    getIt.registerSingleton<UserStore>(UserStore());
    getIt.registerSingleton<AuthRepository>(ApiAuthRepository(getIt()));
    getIt.registerSingleton<AuthNavigator>(AuthNavigator(getIt()));
    getIt.registerSingleton<SplashNavigator>(SplashNavigator(getIt()));
    getIt.registerSingleton<SplashCubit>(SplashCubit(getIt(), getIt()));
    getIt.registerSingleton<AuthCubit>(AuthCubit(getIt(), getIt(), getIt()));
    getIt.registerSingleton<BottomBarNavigator>(BottomBarNavigator());
    getIt.registerSingleton<BottomBarCubit>(BottomBarCubit(getIt()));
  }
}
