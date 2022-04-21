// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i11;
import 'package:base_flutter/general/screens/change_password/ChangePasswordImports.dart'
    as _i7;
import 'package:base_flutter/general/screens/confirm_password/ConfirmPasswordImports.dart'
    as _i6;
import 'package:base_flutter/general/screens/contact_us/ContactUsImports.dart'
    as _i4;
import 'package:base_flutter/general/screens/home/home_imports.dart' as _i10;
import 'package:base_flutter/general/screens/image_zoom/ImageZoom.dart' as _i8;
import 'package:base_flutter/general/screens/login/LoginImports.dart' as _i2;
import 'package:base_flutter/general/screens/register/RegisterImports.dart'
    as _i9;
import 'package:base_flutter/general/screens/select_lang/SelectLangImports.dart'
    as _i3;
import 'package:base_flutter/general/screens/select_user/SelectUserImports.dart'
    as _i5;
import 'package:base_flutter/general/screens/splash/SplashImports.dart' as _i1;
import 'package:flutter/material.dart' as _i12;

class AppRouter extends _i11.RootStackRouter {
  AppRouter([_i12.GlobalKey<_i12.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i11.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      final args = routeData.argsAs<SplashRouteArgs>();
      return _i11.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i1.Splash(navigatorKey: args.navigatorKey));
    },
    LoginRoute.name: (routeData) {
      return _i11.CustomPage<dynamic>(
          routeData: routeData,
          child: _i2.Login(),
          opaque: true,
          barrierDismissible: false);
    },
    SelectLangRoute.name: (routeData) {
      return _i11.AdaptivePage<dynamic>(
          routeData: routeData, child: _i3.SelectLang());
    },
    ContactUsRoute.name: (routeData) {
      return _i11.AdaptivePage<dynamic>(
          routeData: routeData, child: _i4.ContactUs());
    },
    SelectUserRoute.name: (routeData) {
      return _i11.CustomPage<dynamic>(
          routeData: routeData,
          child: _i5.SelectUser(),
          transitionsBuilder: _i11.TransitionsBuilders.fadeIn,
          durationInMilliseconds: 1500,
          opaque: true,
          barrierDismissible: false);
    },
    ConfirmPasswordRoute.name: (routeData) {
      return _i11.AdaptivePage<dynamic>(
          routeData: routeData, child: _i6.ConfirmPassword());
    },
    ChangePasswordRoute.name: (routeData) {
      return _i11.AdaptivePage<dynamic>(
          routeData: routeData, child: _i7.ChangePassword());
    },
    ImageZoomRoute.name: (routeData) {
      final args = routeData.argsAs<ImageZoomRouteArgs>();
      return _i11.AdaptivePage<dynamic>(
          routeData: routeData, child: _i8.ImageZoom(images: args.images));
    },
    RegisterRoute.name: (routeData) {
      return _i11.AdaptivePage<dynamic>(
          routeData: routeData, child: _i9.Register());
    },
    HomeRoute.name: (routeData) {
      return _i11.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i10.Home());
    }
  };

  @override
  List<_i11.RouteConfig> get routes => [
        _i11.RouteConfig(SplashRoute.name, path: '/'),
        _i11.RouteConfig(LoginRoute.name, path: '/Login'),
        _i11.RouteConfig(SelectLangRoute.name, path: '/select-lang'),
        _i11.RouteConfig(ContactUsRoute.name, path: '/contact-us'),
        _i11.RouteConfig(SelectUserRoute.name, path: '/select-user'),
        _i11.RouteConfig(ConfirmPasswordRoute.name, path: '/confirm-password'),
        _i11.RouteConfig(ChangePasswordRoute.name, path: '/change-password'),
        _i11.RouteConfig(ImageZoomRoute.name, path: '/image-zoom'),
        _i11.RouteConfig(RegisterRoute.name, path: '/Register'),
        _i11.RouteConfig(HomeRoute.name, path: '/Home')
      ];
}

/// generated route for
/// [_i1.Splash]
class SplashRoute extends _i11.PageRouteInfo<SplashRouteArgs> {
  SplashRoute({required _i12.GlobalKey<_i12.NavigatorState> navigatorKey})
      : super(SplashRoute.name,
            path: '/', args: SplashRouteArgs(navigatorKey: navigatorKey));

  static const String name = 'SplashRoute';
}

class SplashRouteArgs {
  const SplashRouteArgs({required this.navigatorKey});

  final _i12.GlobalKey<_i12.NavigatorState> navigatorKey;

  @override
  String toString() {
    return 'SplashRouteArgs{navigatorKey: $navigatorKey}';
  }
}

/// generated route for
/// [_i2.Login]
class LoginRoute extends _i11.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '/Login');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i3.SelectLang]
class SelectLangRoute extends _i11.PageRouteInfo<void> {
  const SelectLangRoute() : super(SelectLangRoute.name, path: '/select-lang');

  static const String name = 'SelectLangRoute';
}

/// generated route for
/// [_i4.ContactUs]
class ContactUsRoute extends _i11.PageRouteInfo<void> {
  const ContactUsRoute() : super(ContactUsRoute.name, path: '/contact-us');

  static const String name = 'ContactUsRoute';
}

/// generated route for
/// [_i5.SelectUser]
class SelectUserRoute extends _i11.PageRouteInfo<void> {
  const SelectUserRoute() : super(SelectUserRoute.name, path: '/select-user');

  static const String name = 'SelectUserRoute';
}

/// generated route for
/// [_i6.ConfirmPassword]
class ConfirmPasswordRoute extends _i11.PageRouteInfo<void> {
  const ConfirmPasswordRoute()
      : super(ConfirmPasswordRoute.name, path: '/confirm-password');

  static const String name = 'ConfirmPasswordRoute';
}

/// generated route for
/// [_i7.ChangePassword]
class ChangePasswordRoute extends _i11.PageRouteInfo<void> {
  const ChangePasswordRoute()
      : super(ChangePasswordRoute.name, path: '/change-password');

  static const String name = 'ChangePasswordRoute';
}

/// generated route for
/// [_i8.ImageZoom]
class ImageZoomRoute extends _i11.PageRouteInfo<ImageZoomRouteArgs> {
  ImageZoomRoute({required List<dynamic> images})
      : super(ImageZoomRoute.name,
            path: '/image-zoom', args: ImageZoomRouteArgs(images: images));

  static const String name = 'ImageZoomRoute';
}

class ImageZoomRouteArgs {
  const ImageZoomRouteArgs({required this.images});

  final List<dynamic> images;

  @override
  String toString() {
    return 'ImageZoomRouteArgs{images: $images}';
  }
}

/// generated route for
/// [_i9.Register]
class RegisterRoute extends _i11.PageRouteInfo<void> {
  const RegisterRoute() : super(RegisterRoute.name, path: '/Register');

  static const String name = 'RegisterRoute';
}

/// generated route for
/// [_i10.Home]
class HomeRoute extends _i11.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '/Home');

  static const String name = 'HomeRoute';
}
