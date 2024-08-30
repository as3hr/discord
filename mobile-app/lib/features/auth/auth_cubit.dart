import 'package:discord/domain/repositories/auth_repository.dart';
import 'package:discord/features/auth/auth_navigator.dart';
import 'package:discord/helpers/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository authRepository;
  final AuthNavigator navigation;
  AuthCubit(this.authRepository, this.navigation) : super(AuthState.initial());

  Future<void> login(
    String email,
    String password,
    BuildContext context,
  ) async {
    emit(state.copyWith(isLoading: true));
    authRepository.login(email, password).then((result) => result.fold(
          (failure) => {
            emit(state.copyWith(isLoading: false)),
            if (context.mounted)
              {
                showToast(failure.error, context),
              }
          },
          (user) => {
            emit(state.copyWith(isLoading: false)),
            navigation.goToBottomBar(),
            if (context.mounted)
              {
                showToast('Logged in successfully!', context),
              }
          },
        ));
  }
}
