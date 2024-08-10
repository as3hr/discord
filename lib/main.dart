import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:discord/firebase_options.dart';
import 'package:discord/routing/app_navigation.dart';

import 'routing/route_generator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const Discord());
}

class Discord extends StatelessWidget {
  const Discord({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: generateRoute,
      navigatorKey: AppNavigation.globalKey,
    );
  }
}
