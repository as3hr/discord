import 'package:discord/main.dart';
import 'package:discord/screens/auth/login/login_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppProvider {
  static final providers = [
    BlocProvider(create: (context) => LoginCubit(getIt(), getIt(), getIt())),
  ];
}
