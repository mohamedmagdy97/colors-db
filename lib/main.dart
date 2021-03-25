import 'package:auto_route/auto_route.dart';
import 'package:base_flutter/general/blocks/lang_cubit.dart';
import 'package:base_flutter/general/utilities/main_data/MainDataImports.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'general/screens/splash/Splash.dart';
import 'general/utilities/routers/RouterImports.gr.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    BlocProvider(
      create: (BuildContext context) => LangCubit(),
      child: MyApp(),
    )
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final navigatorKey = new GlobalKey<NavigatorState>();
  final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    final botToastBuilder = BotToastInit();
    return MultiBlocProvider(
      providers: MainData.providers(context),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: MainData.defaultThem,
        title: "Base Flutter",
        localizationsDelegates: AppLocalizations.localizationsDelegates, // Add this line
        supportedLocales: AppLocalizations.supportedLocales,
        locale: context.watch<LangCubit>().state.locale,
          routerDelegate: _appRouter.delegate(
            navigatorObservers: [BotToastNavigatorObserver()],
            navigatorKey: navigatorKey
          ),
          routeInformationParser: _appRouter.defaultRouteParser(),
          builder: (ctx, child) {
            child = FlutterEasyLoading(child: child);  //do something
            child = botToastBuilder(context,child);
            return child;
          }
      ),
    );
  }
}
