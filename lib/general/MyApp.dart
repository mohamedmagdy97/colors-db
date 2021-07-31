import 'package:base_flutter/general/utilities/routers/RouterImports.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tf_validator/localization/SetLocalization.dart';
import 'blocks/lang_cubit/lang_cubit.dart';
import 'utilities/main_data/MainDataImports.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final navigatorKey = new GlobalKey<NavigatorState>();
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: MainData.providers(context),
      child: BlocBuilder<LangCubit, LangState>(
        builder: (context, state) {
          return MaterialApp.router(
              debugShowCheckedModeBanner: false,
              theme: MainData.defaultThem,
              title: "Base Flutter",
              supportedLocales: [
                Locale('en', 'US'),
                Locale('ar', 'EG')
              ],
              localizationsDelegates: [
                SetLocalization.localizationsDelegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              locale: state.locale,
              routerDelegate: _appRouter.delegate(
                  initialRoutes: [SplashRoute(navigatorKey: navigatorKey)]
              ),
              routeInformationParser: _appRouter.defaultRouteParser(),
              builder: (ctx, child) {
                child = FlutterEasyLoading(child: child); //do something
                return child;
              }
          );
        },
      ),
    );
  }
}
