part of 'RouterImports.dart';


@AdaptiveAutoRouter(
  routes: <AutoRoute>[
    //general routes
    AutoRoute(page: Splash, initial: true,),
    AutoRoute(page: Login),
    AutoRoute(page: ForgetPassword),
    AutoRoute(page: ResetPassword),

    //customer routes




  ],
)
class $AppRouter {}