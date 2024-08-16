import 'package:discord/features/bottom_bar/bottom_bar_container.dart';
import 'package:discord/features/bottom_bar/bottom_bar_cubit.dart';
import 'package:discord/features/bottom_bar/bottom_bar_state.dart';
import 'package:discord/helpers/helpers.dart';
import 'package:discord/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key, required this.cubit});
  final BottomBarCubit cubit;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomBarCubit, BottomBarState>(
        bloc: cubit,
        builder: (context, state) {
          return PopScope(
            canPop: false,
            onPopInvoked: (didPop) async {
              if (didPop) return;

              if (await showConfirmationDialog(
                      'Do you want to exit the app?', context) &&
                  context.mounted) {
                Navigator.pop(context);
              }
            },
            child: Scaffold(
              resizeToAvoidBottomInset: true,
              body: Stack(
                children: [
                  state.page,
                  BottomBarContainer(cubit: getIt(), homeCubit: getIt()),
                ],
              ),
            ),
          );
        });
  }
}
