part of 'RouterImports.dart';

@AdaptiveAutoRouter(
  routes: <AutoRoute>[
    AdaptiveRoute(page: Splash, initial: true),
    AdaptiveRoute(page: Register),
    AdaptiveRoute(page: Home),
  ],
)
class $AppRouter {}