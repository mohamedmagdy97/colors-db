part of 'RouterImports.dart';


@AdaptiveAutoRouter(
  routes: <AutoRoute>[
    //general routes
    AdaptiveRoute(page: Splash, initial: true,),
    CustomRoute(page: Login,),
    AdaptiveRoute(page: ForgetPassword),
    AdaptiveRoute(page: ActiveAccount),
    AdaptiveRoute(page: ResetPassword),
    AdaptiveRoute(page: SelectLang),
    AdaptiveRoute(page: Terms),
    AdaptiveRoute(page: About),
    AdaptiveRoute(page: ContactUs),
    AdaptiveRoute(page: SelectUser),
    AdaptiveRoute(page: ConfirmPassword),
    AdaptiveRoute(page: ChangePassword),
    AdaptiveRoute(page: ImageZoom),

  ],
)
class $AppRouter {}