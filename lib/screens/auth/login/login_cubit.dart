import 'package:discord/domain/repositories/login_repository.dart';
import 'package:discord/screens/auth/login/login_navigator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:discord/screens/auth/login/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepository loginRepository;
  final LoginNavigator navigation;
  LoginCubit(this.loginRepository, this.navigation)
      : super(LoginState.initial());

  Future<void> login(String email, String password) async {
    emit(state.copyWith(isLoading: true, email: email, password: password));
    // final user = await loginRepository.login(email, password);
    emit(state.copyWith(isLoading: false));
    navigation.goToProfile();
  }
}
