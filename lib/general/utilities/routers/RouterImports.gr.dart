// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';

import '../../screens/contact_us/ContactUs.dart';
import '../../screens/forget_password/ForgetPasswordImports.dart';
import '../../screens/image_zoom/ImageZoom.dart';
import '../../screens/login/LoginImports.dart';
import '../../screens/reset_password/ResetPasswordImports.dart';
import '../../screens/splash/Splash.dart';
import '../../screens/terms/Terms.dart';

class Routes {
  static const String splash = '/';
  static const String login = '/Login';
  static const String imageZoom = '/image-zoom';
  static const String forgetPassword = '/forget-password';
  static const String resetPassword = '/reset-password';
  static const String terms = '/Terms';
  static const String contactUs = '/contact-us';
  static const all = <String>{
    splash,
    login,
    imageZoom,
    forgetPassword,
    resetPassword,
    terms,
    contactUs,
  };
}

class AppRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.splash, page: Splash),
    RouteDef(Routes.login, page: Login),
    RouteDef(Routes.imageZoom, page: ImageZoom),
    RouteDef(Routes.forgetPassword, page: ForgetPassword),
    RouteDef(Routes.resetPassword, page: ResetPassword),
    RouteDef(Routes.terms, page: Terms),
    RouteDef(Routes.contactUs, page: ContactUs),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    Splash: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => Splash(),
        settings: data,
      );
    },
    Login: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => Login(),
        settings: data,
      );
    },
    ImageZoom: (data) {
      final args = data.getArgs<ImageZoomArguments>(nullOk: false);
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => ImageZoom(
          args.images,
          args.index,
        ),
        settings: data,
      );
    },
    ForgetPassword: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => ForgetPassword(),
        settings: data,
      );
    },
    ResetPassword: (data) {
      final args = data.getArgs<ResetPasswordArguments>(nullOk: false);
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => ResetPassword(userId: args.userId),
        settings: data,
      );
    },
    Terms: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => Terms(),
        settings: data,
      );
    },
    ContactUs: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => ContactUs(),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// ImageZoom arguments holder class
class ImageZoomArguments {
  final List<String> images;
  final int index;
  ImageZoomArguments({@required this.images, @required this.index});
}

/// ResetPassword arguments holder class
class ResetPasswordArguments {
  final String userId;
  ResetPasswordArguments({@required this.userId});
}
