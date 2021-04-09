// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:base_flutter/general/screens/about/AboutImports.dart' as _i9;
import 'package:base_flutter/general/screens/active_account/ActiveAccountImports.dart'
    as _i5;
import 'package:base_flutter/general/screens/change_password/ChangePasswordImports.dart'
    as _i13;
import 'package:base_flutter/general/screens/confirm_password/ConfirmPasswordImports.dart'
    as _i12;
import 'package:base_flutter/general/screens/contact_us/ContactUsImports.dart'
    as _i10;
import 'package:base_flutter/general/screens/forget_password/ForgetPasswordImports.dart'
    as _i4;
import 'package:base_flutter/general/screens/image_zoom/ImageZoom.dart' as _i14;
import 'package:base_flutter/general/screens/login/LoginImports.dart' as _i3;
import 'package:base_flutter/general/screens/reset_password/ResetPasswordImports.dart'
    as _i6;
import 'package:base_flutter/general/screens/select_lang/SelectLangImports.dart'
    as _i7;
import 'package:base_flutter/general/screens/select_user/SelectUserImports.dart'
    as _i11;
import 'package:base_flutter/general/screens/splash/SplashImports.dart' as _i2;
import 'package:base_flutter/general/screens/terms/TermsImports.dart' as _i8;
import 'package:flutter/material.dart' as _i15;

class AppRouter extends _i1.RootStackRouter {
  AppRouter();

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    SplashRoute.name: (entry) {
      var args = entry.routeData
          .argsAs<SplashRouteArgs>(orElse: () => SplashRouteArgs());
      return _i1.AdaptivePage(
          entry: entry, child: _i2.Splash(navigatorKey: args.navigatorKey));
    },
    LoginRoute.name: (entry) {
      return _i1.AdaptivePage(entry: entry, child: _i3.Login());
    },
    ForgetPasswordRoute.name: (entry) {
      return _i1.AdaptivePage(entry: entry, child: _i4.ForgetPassword());
    },
    ActiveAccountRoute.name: (entry) {
      var args = entry.routeData.argsAs<ActiveAccountRouteArgs>(
          orElse: () => ActiveAccountRouteArgs());
      return _i1.AdaptivePage(
          entry: entry, child: _i5.ActiveAccount(userId: args.userId));
    },
    ResetPasswordRoute.name: (entry) {
      var args = entry.routeData.argsAs<ResetPasswordRouteArgs>(
          orElse: () => ResetPasswordRouteArgs());
      return _i1.AdaptivePage(
          entry: entry, child: _i6.ResetPassword(userId: args.userId));
    },
    SelectLangRoute.name: (entry) {
      return _i1.AdaptivePage(entry: entry, child: _i7.SelectLang());
    },
    TermsRoute.name: (entry) {
      return _i1.AdaptivePage(entry: entry, child: _i8.Terms());
    },
    AboutRoute.name: (entry) {
      return _i1.AdaptivePage(entry: entry, child: _i9.About());
    },
    ContactUsRoute.name: (entry) {
      return _i1.AdaptivePage(entry: entry, child: _i10.ContactUs());
    },
    SelectUserRoute.name: (entry) {
      return _i1.AdaptivePage(entry: entry, child: _i11.SelectUser());
    },
    ConfirmPasswordRoute.name: (entry) {
      return _i1.AdaptivePage(entry: entry, child: _i12.ConfirmPassword());
    },
    ChangePasswordRoute.name: (entry) {
      return _i1.AdaptivePage(entry: entry, child: _i13.ChangePassword());
    },
    ImageZoomRoute.name: (entry) {
      var args = entry.routeData
          .argsAs<ImageZoomRouteArgs>(orElse: () => ImageZoomRouteArgs());
      return _i1.AdaptivePage(
          entry: entry, child: _i14.ImageZoom(images: args.images));
    }
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(SplashRoute.name, path: '/'),
        _i1.RouteConfig(LoginRoute.name, path: '/Login'),
        _i1.RouteConfig(ForgetPasswordRoute.name, path: '/forget-password'),
        _i1.RouteConfig(ActiveAccountRoute.name, path: '/active-account'),
        _i1.RouteConfig(ResetPasswordRoute.name, path: '/reset-password'),
        _i1.RouteConfig(SelectLangRoute.name, path: '/select-lang'),
        _i1.RouteConfig(TermsRoute.name, path: '/Terms'),
        _i1.RouteConfig(AboutRoute.name, path: '/About'),
        _i1.RouteConfig(ContactUsRoute.name, path: '/contact-us'),
        _i1.RouteConfig(SelectUserRoute.name, path: '/select-user'),
        _i1.RouteConfig(ConfirmPasswordRoute.name, path: '/confirm-password'),
        _i1.RouteConfig(ChangePasswordRoute.name, path: '/change-password'),
        _i1.RouteConfig(ImageZoomRoute.name, path: '/image-zoom')
      ];
}

class SplashRoute extends _i1.PageRouteInfo<SplashRouteArgs> {
  SplashRoute({_i15.GlobalKey<_i15.NavigatorState> navigatorKey})
      : super(name,
            path: '/', args: SplashRouteArgs(navigatorKey: navigatorKey));

  static const String name = 'SplashRoute';
}

class SplashRouteArgs {
  const SplashRouteArgs({this.navigatorKey});

  final _i15.GlobalKey<_i15.NavigatorState> navigatorKey;
}

class LoginRoute extends _i1.PageRouteInfo {
  const LoginRoute() : super(name, path: '/Login');

  static const String name = 'LoginRoute';
}

class ForgetPasswordRoute extends _i1.PageRouteInfo {
  const ForgetPasswordRoute() : super(name, path: '/forget-password');

  static const String name = 'ForgetPasswordRoute';
}

class ActiveAccountRoute extends _i1.PageRouteInfo<ActiveAccountRouteArgs> {
  ActiveAccountRoute({String userId})
      : super(name,
            path: '/active-account',
            args: ActiveAccountRouteArgs(userId: userId));

  static const String name = 'ActiveAccountRoute';
}

class ActiveAccountRouteArgs {
  const ActiveAccountRouteArgs({this.userId});

  final String userId;
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

class SelectLangRoute extends _i1.PageRouteInfo {
  const SelectLangRoute() : super(name, path: '/select-lang');

  static const String name = 'SelectLangRoute';
}

class TermsRoute extends _i1.PageRouteInfo {
  const TermsRoute() : super(name, path: '/Terms');

  static const String name = 'TermsRoute';
}

class AboutRoute extends _i1.PageRouteInfo {
  const AboutRoute() : super(name, path: '/About');

  static const String name = 'AboutRoute';
}

class ContactUsRoute extends _i1.PageRouteInfo {
  const ContactUsRoute() : super(name, path: '/contact-us');

  static const String name = 'ContactUsRoute';
}

class SelectUserRoute extends _i1.PageRouteInfo {
  const SelectUserRoute() : super(name, path: '/select-user');

  static const String name = 'SelectUserRoute';
}

class ConfirmPasswordRoute extends _i1.PageRouteInfo {
  const ConfirmPasswordRoute() : super(name, path: '/confirm-password');

  static const String name = 'ConfirmPasswordRoute';
}

class ChangePasswordRoute extends _i1.PageRouteInfo {
  const ChangePasswordRoute() : super(name, path: '/change-password');

  static const String name = 'ChangePasswordRoute';
}

class ImageZoomRoute extends _i1.PageRouteInfo<ImageZoomRouteArgs> {
  ImageZoomRoute({List<dynamic> images})
      : super(name,
            path: '/image-zoom', args: ImageZoomRouteArgs(images: images));

  static const String name = 'ImageZoomRoute';
}

class ImageZoomRouteArgs {
  const ImageZoomRouteArgs({this.images});

  final List<dynamic> images;
}
