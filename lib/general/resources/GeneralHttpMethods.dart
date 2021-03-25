import 'package:base_flutter/general/blocks/lang_cubit.dart';
import 'package:base_flutter/general/models/UserModel.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:base_flutter/general/constants/GlobalState.dart';
import 'package:base_flutter/general/constants/ModaLs/LoadingDialog.dart';
import 'package:base_flutter/general/utilities/dio_helper/DioImports.dart';
import 'package:base_flutter/general/utilities/utils_functions/UtilsImports.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GeneralHttpMethods {

  BuildContext context;

  GeneralHttpMethods({@required this.context});

  FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  Future<bool> userLogin(String phone, String pass)async{
    var _token = await _firebaseMessaging.getToken();
    String _lang= context.read<LangCubit>().state.locale.languageCode;
    Map<String,dynamic> body={
      "phone":"$phone",
      "password":"$pass",
      "lang":"$_lang",
      "deviceId":"$_token",
    };
    var _data= await DioHelper().get("/api/v1/login", body);
    if(_data!=null){
      await Utils.setDeviceId(_token);
      UserModel user=UserModel.fromJson(_data["data"]);
      GlobalState.instance.set("token", user.token);
      await Utils.saveUserData(user);
      Utils.setCurrentUserData(user,context);

      return true;
    }else{
      return false;
    }
  }


  Future<String> aboutApp()async{
    Map<String,dynamic> body={
      "lang": context.read<LangCubit>().state.locale.languageCode,
    };
    var _data= await DioHelper(forceRefresh: false).get("/api/v1/GetPagesContentAsync", body);
    if(_data!=null){
      return _data["data"];
    }else{
      return null;
    }
  }

  Future<String> terms()async{
    Map<String,dynamic> body={
      "lang": context.read<LangCubit>().state.locale.languageCode,
    };
    var _data= await DioHelper(forceRefresh: false).get("/api/v1/Condtions", body);
    if(_data!=null){
      return _data["data"]["text"];
    }else{
      return null;
    }
  }


  Future<bool> switchNotify()async{
    Map<String,dynamic> body={
      "lang":"${GlobalState.instance.get("lang")}",
      "user_id":"${GlobalState.instance.get("user_id")}",
    };
    var _data= await DioHelper().post("Client/SwitchNotify", body);
    if(_data!=null){
      return true;
    }else{
      return false;
    }
  }

  Future<bool> forgetPassword(String phone)async{
    String lang = context.read<LangCubit>().state.locale.languageCode;
    Map<String,dynamic> body={
      "phone":"$phone",
      "lang":lang,
    };
    var _data= await DioHelper().get("/api/v1/Forget_password", body);
    if(_data!=null){
      // ExtendedNavigator.of(context).push(
      //   Routes.resetPassword,
      //   arguments: ResetPasswordArguments(userId: "${_data["code"]["user_id"]}")
      // );
      return true;
    }else{
      return null;
    }
  }

  Future<bool> resetUserPassword(String userId,String code,String pass)async{
    String lang = context.read<LangCubit>().state.locale.languageCode;
    Map<String,dynamic> body={
      "userId":"$userId",
      "code":"$code",
      "newPassword":"$pass",
      "lang": lang,
    };
    var _data= await DioHelper().get("/api/v1/ChangePasswordByCode", body);
    if(_data!=null){
      return true;
    }else{
      return false;
    }
  }


  Future<bool> sendMessage(String name,String mail,String message)async{
    Map<String,dynamic> body={
      "lang":"${GlobalState.instance.get("lang")}",
      "name":"$name",
      "email":"$mail",
      "text":"$message",
    };
    var _data= await DioHelper().post("Client/Complaint", body);
    if(_data!=null){
      return true;
    }else{
      return false;
    }
  }

  Future<void> logout()async{
    LoadingDialog.showLoadingDialog();
    String deviceId=await Utils.getDeviceId();
    Map<String,dynamic> body={
      "lang": context.read<LangCubit>().state.locale.languageCode,
      "device_id":"$deviceId"
    };
    print(body);
    await DioHelper().get("/api/v1/logout", body);
    EasyLoading.dismiss().then((value){
      Utils.clearSavedData();
      Phoenix.rebirth(context);
    });
  }


}
