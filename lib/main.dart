import 'package:flutter/material.dart';

import 'presentation/login/screen/login_screen.dart';
import 'presentation/resources/routes_manager.dart';
import 'presentation/resources/theme.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme(),
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: const LoginScreen(),
      onGenerateRoute: RouteGenerator.getRoute,
      navigatorKey: navigatorKey,
      initialRoute: Routes.initialScreenRoute,
    );
  }
}
