import 'package:discord/helpers/styles/app_colors.dart';
import 'package:discord/helpers/styles/styles.dart';
import 'package:discord/helpers/widgets/input_field.dart';
import 'package:discord/features/auth/login/login_cubit.dart';
import 'package:discord/features/auth/login/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final loginCubit = BlocProvider.of<LoginCubit>(context);
    loginCubit.navigation.context = context;
    return Scaffold(
      backgroundColor: AppColor.black5,
      body: BlocBuilder<LoginCubit, LoginState>(
          bloc: loginCubit,
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InputField(
                  onChanged: (val) {
                    state.email = val;
                  },
                  hintText: 'Email',
                ),
                InputField(
                  onChanged: (val) {
                    state.password = val;
                  },
                  hintText: 'Password',
                ),
                const Gap(30),
                GestureDetector(
                  onTap: () => loginCubit.login(
                    state.email,
                    state.password,
                    context,
                  ),
                  child: Container(
                    color: AppColor.white,
                    width: 170,
                    padding: const EdgeInsets.all(10),
                    child: state.isLoading
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : Center(
                            child: Text(
                            'GET IN!',
                            style: Styles.boldStyle(
                                fontSize: 20, color: AppColor.black3),
                          )),
                  ),
                ),
              ],
            );
          }),
    );
  }
}
