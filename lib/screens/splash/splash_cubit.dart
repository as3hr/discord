import 'package:discord/screens/splash/splash_navigator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  final SplashNavigator navigator;
  SplashCubit(this.navigator) : super(SplashState());

  onInit() {
    Future.delayed(const Duration(seconds: 2));
    navigator.goToLogin();
  }
}
