import 'package:discord/domain/repositories/local_storage_repository.dart';
import 'package:discord/domain/repositories/login_repository.dart';
import 'package:discord/helpers/helpers.dart';
import 'package:discord/screens/auth/login/login_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:discord/screens/auth/login/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepository loginRepository;
  final LoginNavigator navigation;
  final LocalStorageRepository localStorage;
  LoginCubit(this.loginRepository, this.navigation, this.localStorage)
      : super(LoginState.initial());

  Future<void> login(
      String email, String password, BuildContext context) async {
    emit(state.copyWith(isLoading: true));
    loginRepository.login(email, password).then((result) => result.fold(
          (failure) => {
            emit(state.copyWith(isLoading: false)),
            if (context.mounted)
              {
                showToast(failure.error, context),
              }
          },
          (user) => {
            emit(state.copyWith(isLoading: false)),
            localStorage.setUser('USER_EMAIL', user.email.toString()),
            navigation.goToHome(),
            showToast('Logged in successfully!', context),
          },
        ));
  }
}
