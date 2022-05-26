import 'package:colors_db/general/utilities/routers/RouterImports.gr.dart';
import 'package:flutter/material.dart';
import 'utilities/main_data/MainDataImports.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: MainData.defaultThem,
      title: "Colors db",
      routerDelegate: _appRouter.delegate(initialRoutes: [SplashRoute()]),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}
