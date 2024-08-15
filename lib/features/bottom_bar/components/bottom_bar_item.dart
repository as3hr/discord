import 'package:discord/features/home/home_screen.dart';
import 'package:discord/features/notification/notification_page.dart';
import 'package:discord/features/profile/profile_screen.dart';
import 'package:flutter/material.dart';

class BottomBarItem {
  Widget page;
  String title;
  String icon;

  BottomBarItem({
    required this.icon,
    required this.page,
    required this.title,
  });
  static final items = [
    BottomBarItem(
      icon: 'home',
      page: const HomeScreen(),
      title: 'Home',
    ),
    BottomBarItem(
      icon: 'home',
      page: const NotificationPage(),
      title: 'Notifications',
    ),
    BottomBarItem(
      icon: 'You',
      page: const ProfileScreen(),
      title: 'You',
    ),
  ];
}
