import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:discord/helpers/extensions.dart';
import 'package:discord/helpers/styles/app_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:discord/firebase_options.dart';
import 'package:discord/routing/app_navigation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loader_overlay/loader_overlay.dart';

import 'routing/route_generator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final themeMode = await AdaptiveTheme.getThemeMode();
  runApp(Discord(themMode: themeMode));
}

class Discord extends StatelessWidget {
  final AdaptiveThemeMode? themMode;
  const Discord({super.key, required this.themMode});
  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: AppTheme.theme(),
      initial: themMode ?? AdaptiveThemeMode.dark,
      dark: AppTheme.theme(dark: true),
      builder: (light, dark) {
        return GlobalLoaderOverlay(
          child: ScreenUtilInit(
              designSize: Size(context.screenWidth, context.screenHeight),
              builder: (context, _) {
                return MaterialApp(
                  theme: AppTheme.theme(),
                  darkTheme: AppTheme.theme(dark: true),
                  themeMode: ThemeMode.dark,
                  debugShowCheckedModeBanner: false,
                  onGenerateRoute: generateRoute,
                  navigatorKey: AppNavigation.globalKey,
                );
              }),
        );
      },
    );
  }
}
