// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:base_flutter/general/screens/forget_password/ForgetPasswordImports.dart'
    as _i4;
import 'package:base_flutter/general/screens/login/LoginImports.dart' as _i3;
import 'package:base_flutter/general/screens/reset_password/ResetPasswordImports.dart'
    as _i5;
import 'package:base_flutter/general/screens/splash/Splash.dart' as _i2;

class AppRouter extends _i1.RootStackRouter {
  AppRouter();

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    SplashRoute.name: (entry) {
      return _i1.AdaptivePage(entry: entry, child: _i2.Splash());
    },
    LoginRoute.name: (entry) {
      return _i1.AdaptivePage(entry: entry, child: _i3.Login());
    },
    ForgetPasswordRoute.name: (entry) {
      return _i1.AdaptivePage(entry: entry, child: _i4.ForgetPassword());
    },
    ResetPasswordRoute.name: (entry) {
      var args = entry.routeData.argsAs<ResetPasswordRouteArgs>(
          orElse: () => ResetPasswordRouteArgs());
      return _i1.AdaptivePage(
          entry: entry, child: _i5.ResetPassword(userId: args.userId));
    }
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(SplashRoute.name, path: '/'),
        _i1.RouteConfig(LoginRoute.name, path: '/Login'),
        _i1.RouteConfig(ForgetPasswordRoute.name, path: '/forget-password'),
        _i1.RouteConfig(ResetPasswordRoute.name, path: '/reset-password')
      ];
}

class SplashRoute extends _i1.PageRouteInfo {
  const SplashRoute() : super(name, path: '/');

  static const String name = 'SplashRoute';
}

class LoginRoute extends _i1.PageRouteInfo {
  const LoginRoute() : super(name, path: '/Login');

  static const String name = 'LoginRoute';
}

class ForgetPasswordRoute extends _i1.PageRouteInfo {
  const ForgetPasswordRoute() : super(name, path: '/forget-password');

  static const String name = 'ForgetPasswordRoute';
}

class ResetPasswordRoute extends _i1.PageRouteInfo<ResetPasswordRouteArgs> {
  ResetPasswordRoute({String userId})
      : super(name,
            path: '/reset-password',
            args: ResetPasswordRouteArgs(userId: userId));

  static const String name = 'ResetPasswordRoute';
}

class ResetPasswordRouteArgs {
  const ResetPasswordRouteArgs({this.userId});

  final String userId;
}
