part of 'RouterImports.dart';

@AdaptiveAutoRouter(
  routes: <AutoRoute>[
    AdaptiveRoute(page: Splash, initial: true),
    CustomRoute(page: Login),
    AdaptiveRoute(page: Register),
    AdaptiveRoute(page: Home),
  ],
)
class $AppRouter {}