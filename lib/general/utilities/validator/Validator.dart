import 'package:flutter/material.dart';


extension Validator on String {

  String noValidate({@required String value}){
    return null;
  }

  String validateEmpty({String message}){
    if(this.trim().isEmpty){
      return message??"من فضل ادخل الحقل";
    }
    return null;
  }

  String validateDropDown<DataType>({@required DataType model,String message}){
    if(model==null){
      return message??"من فضل ادخل الحقل";
    }
    return null;
  }

  String validatePassword({String message}){
    if(this.trim().isEmpty){
      return message??"من فضل ادخل الحقل";
    }else if(this.length<6){
      return message??"من فضل ادخل علي الاقل ٦ حروف";
    }
    return null;
  }

  String validateEmail({String message}){
    if(this.trim().isEmpty){
      return message??"من فضل ادخل الحقل";
    }else if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(this)){
      return message??"من فضلك ادخل البريد صحيحا";
    }
    return null;
  }
  String validateEmailORNull({String message}){
    if(this.trim().isNotEmpty){
      if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(this)){
        return message??"من فضلك ادخل البريد صحيحا";
      }
    }
    return null;
  }

  String validatePhone({String message}){
    if(this.trim().isEmpty){
      return message??"من فضل ادخل الحقل";
    }else if(!RegExp(r'(^\+[0-9]{2}|^\+[0-9]{2}\(0\)|^\(\+[0-9]{2}\)\(0\)|^00[0-9]{2}|^0)([0-9]{9}$|[0-9\-\s]{10}$)').hasMatch(this)||this.length<10){
      return message??"من فضلك ادخل الجوال صحيحا";
    }
    return null;
  }

  String validatePasswordConfirm({@required String pass,String message}){
    if(this.trim().isEmpty){
      return message??"من فضل ادخل الحقل";
    }else if(this!=pass){
      return message??"من فضلك ادخل رمز المرور متطابقا";
    }
    return null;
  }

}