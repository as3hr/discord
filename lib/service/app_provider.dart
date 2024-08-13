import 'package:discord/main.dart';
import 'package:nested/nested.dart';
import 'package:discord/screens/auth/login/login_cubit.dart';
import 'package:discord/screens/splash/splash_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppProvider {
  static List<SingleChildWidget> providers = [
    BlocProvider(create: (context) => LoginCubit(getIt(), getIt(), getIt())),
    BlocProvider(create: (context) => SplashCubit(getIt(), getIt())..onInit()),
  ];
}
