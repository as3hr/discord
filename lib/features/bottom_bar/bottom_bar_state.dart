import 'package:discord/features/bottom_bar/components/bottom_bar_item.dart';
import 'package:discord/features/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BottomBarState {
  List<BottomBarItem> items;
  Widget page;
  int currentIndex;
  BottomBarState({
    this.page = const HomeScreen(),
    this.currentIndex = 0,
    required this.items,
  });

  factory BottomBarState.empty() => BottomBarState(
        items: BottomBarItem.items,
        currentIndex: 0,
        page: const HomeScreen(),
      );

  BottomBarState copyWith(
      {Widget? page, int? currentIndex = 0, List<BottomBarItem>? items}) {
    return BottomBarState(
      page: page ?? this.page,
      items: BottomBarItem.items,
      currentIndex: currentIndex ?? this.currentIndex,
    );
  }
}
