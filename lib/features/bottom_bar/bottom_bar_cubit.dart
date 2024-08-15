import 'package:discord/features/bottom_bar/bottom_bar_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bottom_bar_state.dart';

class BottomBarCubit extends Cubit<BottomBarState> {
  final BottomBarNavigator navigation;
  BottomBarCubit(this.navigation) : super(BottomBarState.empty());

  void updateIndex(int index) {
    emit(state.copyWith(currentIndex: index, page: getPage(index)));
  }

  Widget getPage(int index) {
    final page = state.items.map((item) {
      return state.items[index].page;
    }).first;
    return page;
  }
}
