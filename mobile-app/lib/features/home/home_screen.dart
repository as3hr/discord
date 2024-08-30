import 'package:discord/features/home/components/home_body.dart';
import 'package:discord/features/home/home_cubit.dart';
import 'package:discord/features/home/home_state.dart';
import 'package:discord/helpers/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../domain/stores/user_store.dart';
import '../../main.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.cubit});
  final HomeCubit cubit;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeCubit homeCubit;
  final user = getIt<UserStore>().state;

  @override
  void initState() {
    super.initState();
    homeCubit = widget.cubit;
    homeCubit.onInit();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<HomeCubit, HomeState>(
            bloc: homeCubit,
            builder: (context, state) {
              return GestureDetector(
                onHorizontalDragUpdate: (details) {
                  widget.cubit.onDragUpdate(details);
                },
                onHorizontalDragEnd: (details) {
                  widget.cubit.onDragEnd();
                },
                child: Stack(
                  children: [
                    const HomeBody(),
                    AnimatedPositioned(
                      duration: const Duration(milliseconds: 150),
                      top: 0,
                      left: state.panelOffsetX,
                      child: Container(
                        width: 1.sw,
                        height: 1.sh,
                        decoration: const BoxDecoration(
                          color: AppColor.black1,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                          ),
                        ),
                        child: Center(
                          child: Column(
                            children: List.generate(15, (index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Panel Item $index + User is: ${user.email}',
                                  style: const TextStyle(color: AppColor.white),
                                ),
                              );
                            }),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
