import 'package:discord/domain/repositories/local_storage_repository.dart';
import 'package:discord/features/splash/splash_navigator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  final SplashNavigator navigator;
  final LocalStorageRepository localStorageRepository;
  SplashCubit(this.navigator, this.localStorageRepository)
      : super(SplashState());

  onInit() {
    Future.delayed(
        const Duration(seconds: 2),
        () => {
              localStorageRepository
                  .getValue('USER_EMAIL')
                  .then((value) => value.fold(
                        (error) {
                          navigator.goToLogin();
                        },
                        (value) {
                          navigator.goToBottomBar();
                        },
                      ))
            });
  }
}
