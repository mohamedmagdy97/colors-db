part of 'RouterImports.dart';


@AdaptiveAutoRouter(
  routes: <AutoRoute>[
    //general routes
    AutoRoute(page: Splash, initial: true,),
    AutoRoute(page: Login),
    AutoRoute(page: ImageZoom),
    AutoRoute(page: ForgetPassword),
    AutoRoute(page: ResetPassword),
    AutoRoute(page: Terms),
    AutoRoute(page: ContactUs),

    //customer routes




  ],
)
class $AppRouter {}