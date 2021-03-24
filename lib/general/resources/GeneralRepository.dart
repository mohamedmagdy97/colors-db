import 'package:flutter/material.dart';
import 'GeneralHttpMethods.dart';

class GeneralRepository{

  BuildContext _context;
  GeneralHttpMethods _generalHttpMethods;
  GeneralRepository(BuildContext context){
    _context = context;
    _generalHttpMethods=new GeneralHttpMethods(context: _context);
  }

  Future<bool> setUserLogin(String phone, String pass) =>
      _generalHttpMethods.userLogin(phone, pass);

  Future<String> aboutApp()=> _generalHttpMethods.aboutApp();

  Future<String> terms()=> _generalHttpMethods.terms();

  Future<bool> switchNotify()=> _generalHttpMethods.switchNotify();

  Future<bool> forgetPassword(String phone)=> _generalHttpMethods.forgetPassword(phone);

  Future<bool> resetUserPassword(String userId,String code,String pass)=>
      _generalHttpMethods.resetUserPassword(userId, code, pass);


  Future<bool> sendMessage(String name,String mail,String message)=>
      _generalHttpMethods.sendMessage(name, mail, message);

  Future<void> logout()=> _generalHttpMethods.logout();

}