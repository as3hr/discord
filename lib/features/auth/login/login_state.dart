class LoginState {
  String email;
  String password;
  bool isLoading;
  LoginState({
    this.isLoading = false,
    required this.email,
    required this.password,
  });

  LoginState copyWith({String? email, String? password, bool? isLoading}) =>
      LoginState(
          email: email ?? this.email,
          password: password ?? this.password,
          isLoading: isLoading ?? this.isLoading);

  factory LoginState.initial() => LoginState(email: '', password: '');
}
