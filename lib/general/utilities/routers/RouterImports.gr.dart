// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i4;
import 'package:base_flutter/general/models/selection_model.dart' as _i6;
import 'package:base_flutter/general/screens/home/home_imports.dart' as _i3;
import 'package:base_flutter/general/screens/register/RegisterImports.dart'
    as _i2;
import 'package:base_flutter/general/screens/splash/SplashImports.dart' as _i1;
import 'package:flutter/material.dart' as _i5;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      final args = routeData.argsAs<SplashRouteArgs>();
      return _i4.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i1.Splash(navigatorKey: args.navigatorKey));
    },
    RegisterRoute.name: (routeData) {
      return _i4.AdaptivePage<dynamic>(
          routeData: routeData, child: _i2.Register());
    },
    HomeRoute.name: (routeData) {
      final args = routeData.argsAs<HomeRouteArgs>();
      return _i4.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i3.Home(
              key: args.key, selectionDataModel: args.selectionDataModel));
    }
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(SplashRoute.name, path: '/'),
        _i4.RouteConfig(RegisterRoute.name, path: '/Register'),
        _i4.RouteConfig(HomeRoute.name, path: '/Home')
      ];
}

/// generated route for
/// [_i1.Splash]
class SplashRoute extends _i4.PageRouteInfo<SplashRouteArgs> {
  SplashRoute({required _i5.GlobalKey<_i5.NavigatorState> navigatorKey})
      : super(SplashRoute.name,
            path: '/', args: SplashRouteArgs(navigatorKey: navigatorKey));

  static const String name = 'SplashRoute';
}

class SplashRouteArgs {
  const SplashRouteArgs({required this.navigatorKey});

  final _i5.GlobalKey<_i5.NavigatorState> navigatorKey;

  @override
  String toString() {
    return 'SplashRouteArgs{navigatorKey: $navigatorKey}';
  }
}

/// generated route for
/// [_i2.Register]
class RegisterRoute extends _i4.PageRouteInfo<void> {
  const RegisterRoute() : super(RegisterRoute.name, path: '/Register');

  static const String name = 'RegisterRoute';
}

/// generated route for
/// [_i3.Home]
class HomeRoute extends _i4.PageRouteInfo<HomeRouteArgs> {
  HomeRoute({_i5.Key? key, required _i6.SelectionDataModel selectionDataModel})
      : super(HomeRoute.name,
            path: '/Home',
            args: HomeRouteArgs(
                key: key, selectionDataModel: selectionDataModel));

  static const String name = 'HomeRoute';
}

class HomeRouteArgs {
  const HomeRouteArgs({this.key, required this.selectionDataModel});

  final _i5.Key? key;

  final _i6.SelectionDataModel selectionDataModel;

  @override
  String toString() {
    return 'HomeRouteArgs{key: $key, selectionDataModel: $selectionDataModel}';
  }
}
