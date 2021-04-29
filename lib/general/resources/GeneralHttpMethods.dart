import 'dart:io';
import 'package:base_flutter/general/blocks/lang_cubit/lang_cubit.dart';
import 'package:base_flutter/general/blocks/user_cubit/user_cubit.dart';
import 'package:base_flutter/general/constants/GlobalState.dart';
import 'package:base_flutter/general/models/QuestionModel.dart';
import 'package:base_flutter/general/models/UserModel.dart';
import 'package:base_flutter/general/utilities/dio_helper/DioImports.dart';
import 'package:base_flutter/general/utilities/utils_functions/UtilsImports.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GeneralHttpMethods {
  BuildContext context;
  late DioHelper dioHelper;

  GeneralHttpMethods({required this.context}){
    dioHelper = context.read<DioHelper>();
  }

  FirebaseMessaging messaging = FirebaseMessaging.instance;

  Future<bool> userLogin(String phone, String pass) async {
    String? _token = await messaging.getToken();
    String _lang = context.read<LangCubit>().state.locale.languageCode;
    Map<String, dynamic> body = {
      "phone": "$phone",
      "password": "$pass",
      "lang": "$_lang",
      "deviceId": "$_token",
      "deviceType": Platform.isIOS ? "ios" : "android",
    };
    var _data =
        await dioHelper.post(url: "/api/v1/login",body: body,context: context,showLoader: false);

    if (_data != null) {
      int status = _data["status"];
      if (status == 1) {
        await Utils.setDeviceId("$_token");
        UserModel user = UserModel.fromJson(_data["data"]);
        int type = _data["data"]["type"];
        user.type = type == 1 ? "user" : "company";
        user.token = _data["token"];
        user.lang = _lang;
        GlobalState.instance.set("token", user.token);
        await Utils.saveUserData(user);
        Utils.setCurrentUserData(user, context);
      } else if (status == 2) {
        // ExtendedNavigator.of(context).push(Routes.activeAccount,
        //     arguments: ActiveAccountArguments(userId: _data["data"]["id"]));
      }
      return true;
    } else {
      return false;
    }
  }

  Future<void> getHomeConstData()async{
    Map<String,dynamic> body={
      "lang":context.read<LangCubit>().state.locale.languageCode,
    };
    var _data= await dioHelper.get(url: "/api/v1/ListAllCat",body: body,context:context,refresh: false);
    if(_data!=null){
     return _data;
    }
    return null;
  }

  Future<bool> sendCode(String code, String userId) async {
    String lang = context.read<LangCubit>().state.locale.languageCode;
    Map<String, dynamic> body = {"lang": lang, "code": code, "userId": userId};
    var _data = await dioHelper
        .post(url: "/api/v1/ConfirmCodeRegister", body: body,context:context, showLoader: false);
    if (_data != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> resendCode(String userId) async {
    String lang = context.read<LangCubit>().state.locale.languageCode;
    Map<String, dynamic> body = {"lang": lang, "userId": userId};
    var _data = await dioHelper.post(url: "/api/v1/ResendCode", body:body,context:context);
    return (_data != null);
  }

  Future<String?> aboutApp() async {
    Map<String, dynamic> body = {
      "lang": context.read<LangCubit>().state.locale.languageCode,
    };
    var _data =
        await dioHelper.get(url: "/api/v1/AboutApp", body:body,context:context);
    if (_data != null) {
      return _data["data"]["about_app"];
    } else {
      return null;
    }
  }

  Future<String?> terms() async {
    Map<String, dynamic> body = {
      "lang": context.read<LangCubit>().state.locale.languageCode,
    };
    var _data =
        await dioHelper.get(url: "/api/v1/AboutApp", body:body,context:context);
    if (_data != null) {
      return _data["data"]["condetions"];
    } else {
      return null;
    }
  }

  Future<List<QuestionModel>> frequentQuestions() async {
    Map<String, dynamic> body = {
      "lang": context.read<LangCubit>().state.locale.languageCode,
    };
    var _data = await dioHelper.get(url: "/api/v1/FrequentlyAskedQuestions", body:body,context:context);
    if (_data != null) {
      return List<QuestionModel>.from(
          _data["data"].map((e) => QuestionModel.fromJson(e)));
    } else {
      return [];
    }
  }

  Future<bool> switchNotify() async {
    Map<String, dynamic> body = {
      "lang": context.read<LangCubit>().state.locale.languageCode,
    };
    var _data = await dioHelper.post(url : "Client/SwitchNotify", body:body,context:context);
    if (_data != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> forgetPassword(String phone) async {
    String lang = context.read<LangCubit>().state.locale.languageCode;
    Map<String, dynamic> body = {
      "phone": "$phone",
      "lang": lang,
    };
    var _data = await dioHelper
        .post(url : "/api/v1/ForgetPassword", body:body ,context:context, showLoader: false);
    if (_data != null) {
      // ExtendedNavigator.of(context).push(Routes.resetPassword,
      //     arguments: ResetPasswordArguments(userId: _data["code"]["user_id"]));
      return true;
    } else {
      return false;
    }
  }

  Future<bool> resetUserPassword(
      String userId, String code, String pass) async {
    String lang = context.read<LangCubit>().state.locale.languageCode;
    Map<String, dynamic> body = {
      "userId": "$userId",
      "code": "$code",
      "newPassword": "$pass",
      "lang": lang,
    };
    var _data = await dioHelper.get(url: "/api/v1/ChangePasswordByCode", body:body,context:context);
    if (_data != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> sendMessage(String? name, String? mail, String? message) async {
    String lang = context.read<LangCubit>().state.locale.languageCode;
    Map<String, dynamic> body = {
      "lang": "$lang",
      "name": "$name",
      "email": "$mail",
      "comment": "$message",
    };
    var _data =
        await dioHelper.post(url : "/api/v1/ContactUs", body:body, context:context, showLoader: false);
    if (_data != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<UserModel?> checkActive(String phone) async {
    Map<String, dynamic> body = {
      "phone": "$phone",
    };
    var _data = await dioHelper.get(url: "/api/v1/CheckActive", body:body ,context:context);
    print("data is $_data");
    if (_data != null) {
      final userCubit = context.read<UserCubit>().state.model;
      UserModel user = UserModel.fromJson(_data["data"]);
      int type = _data["userData"]["type"];
      user.type = type == 1 ? "user" : "company";
      user.token = userCubit.token;
      user.lang = userCubit.lang;
      return user;
    } else {
      return null;
    }
  }
}
