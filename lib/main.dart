import 'package:discord/features/splash/splash_screen.dart';
import 'package:discord/service/app_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:discord/helpers/extensions.dart';
import 'package:discord/helpers/styles/app_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:discord/firebase_options.dart';
import 'package:discord/navigation/app_navigation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:loader_overlay/loader_overlay.dart';

import 'navigation/route_generator.dart';

late final FirebaseAuth auth;
late final FirebaseApp app;
final getIt = GetIt.instance;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  app = await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  auth = FirebaseAuth.instanceFor(app: app);
  final themeMode = await AdaptiveTheme.getThemeMode();
  AppService(getIt);
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
          overlayColor: Colors.transparent,
          child: ScreenUtilInit(
              designSize: Size(context.screenWidth, context.screenHeight),
              builder: (context, _) {
                return MaterialApp(
                  theme: AppTheme.theme(),
                  darkTheme: AppTheme.theme(dark: true),
                  themeMode: ThemeMode.dark,
                  debugShowCheckedModeBanner: false,
                  home: SplashScreen(cubit: getIt()),
                  onGenerateRoute: generateRoute,
                  navigatorKey: AppNavigation.globalKey,
                );
              }),
        );
      },
    );
  }
}
