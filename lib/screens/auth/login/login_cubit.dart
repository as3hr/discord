import 'package:discord/domain/repositories/local_storage_repository.dart';
import 'package:discord/domain/repositories/login_repository.dart';
import 'package:discord/screens/auth/login/login_navigator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:discord/screens/auth/login/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepository loginRepository;
  final LoginNavigator navigation;
  final LocalStorageRepository localStorage;
  LoginCubit(this.loginRepository, this.navigation, this.localStorage)
      : super(LoginState.initial());

  Future<void> login(String email, String password) async {
    emit(state.copyWith(isLoading: true));
    final result = await loginRepository.login(email, password);
    result.fold(
      (failure) => {
        print(failure.error),
        emit(state.copyWith(isLoading: false)),
      },
      (user) => {
        emit(state.copyWith(isLoading: false)),
        localStorage.setUser('USER_EMAIL', user.email.toString()),
        navigation.goToHome(),
      },
    );
  }
}
