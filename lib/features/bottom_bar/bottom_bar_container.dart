import 'package:collection/collection.dart';
import 'package:discord/features/bottom_bar/bottom_bar_cubit.dart';
import 'package:discord/features/bottom_bar/bottom_bar_state.dart';
import 'package:discord/features/home/home_cubit.dart';
import 'package:discord/features/home/home_state.dart';
import 'package:discord/helpers/styles/app_colors.dart';
import 'package:discord/main.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'components/bottom_bar_icon.dart';

class BottomBarContainer extends StatelessWidget {
  const BottomBarContainer(
      {super.key, required this.cubit, required this.homeCubit});
  final BottomBarCubit cubit;
  final HomeCubit homeCubit;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
        bloc: homeCubit,
        builder: (context, homeState) {
          return Container(
            width: 1.sw,
            height: 0.075.sh,
            decoration: const BoxDecoration(
              color: AppColor.black4,
            ),
            child: BlocBuilder<BottomBarCubit, BottomBarState>(
                bloc: cubit,
                builder: (context, bottomBarState) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: bottomBarState.items.mapIndexed((index, item) {
                      return BottomBarIcon(
                        item: item,
                        bottomBarCubit: getIt(),
                        index: index,
                      );
                    }).toList(),
                  );
                }),
          );
        });
  }
}
