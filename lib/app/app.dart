import 'package:flutter/material.dart';

import '../config/router/router.dart';
import '../config/theme/app_theme.dart';

class MyApp extends StatelessWidget {
  MyApp._internal();

  static MyApp instance = MyApp._internal();
  factory MyApp() => instance;

  final appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: "Todolist",
      routerDelegate: appRouter.delegate(),
      routeInformationParser: appRouter.defaultRouteParser(),
      theme: getApplicationTheme(),
    );
  }
}
// }
