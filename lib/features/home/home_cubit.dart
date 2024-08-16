import 'package:discord/features/home/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState.empty());

  onInit() {
    emit(state.copyWith(panelOffsetX: 1.sw, bottomBarOffset: -3));
  }

  void onDragUpdate(DragUpdateDetails details) {
    final newPanelOffset =
        (state.panelOffsetX + details.delta.dx).clamp(0.sw, 1.sw);
    // final bottomBarOffset = -3 * (newPanelOffset / 1.sw);
    final bottomBarOffset = -3 + (1.sh - -3) * (newPanelOffset / 1.sw);
    emit(state.copyWith(
        panelOffsetX: newPanelOffset, bottomBarOffset: bottomBarOffset));
  }

  void onDragEnd() {
    if (state.panelOffsetX < 0.5.sw) {
      emit(state.copyWith(panelOffsetX: 0, bottomBarOffset: 1.sh));
    } else {
      emit(state.copyWith(panelOffsetX: 1.sw, bottomBarOffset: -3));
    }
  }
}
