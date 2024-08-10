import 'package:discord/helpers/styles/app_colors.dart';
import 'package:discord/helpers/styles/styles.dart';
import 'package:discord/helpers/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.black5,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InputField(
            onChanged: (val) {},
            hintText: 'Email',
          ),
          InputField(
            onChanged: (val) {},
            hintText: 'Password',
          ),
          const Gap(30),
          Container(
            color: AppColor.white,
            width: 170,
            padding: const EdgeInsets.all(10),
            child: Center(
                child: Text(
              'GET IN!',
              style: Styles.boldStyle(fontSize: 20, color: AppColor.black3),
            )),
          ),
        ],
      ),
    );
  }
}
