import 'dart:io';

import 'package:base_flutter/general/constants/MyColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:google_fonts/google_fonts.dart';


class AdaptivePicker{

  static datePicker({@required BuildContext context, Function(DateTime date) onConfirm,DateTime initial,DateTime minDate}) async {
    if(Platform.isIOS){
      _iosDatePicker(context,onConfirm,initial: initial,minDate: minDate);
    }else{
      _androidDatePicker(context,onConfirm,initial: initial,minDate: minDate);

    }
  }

  static _androidDatePicker(BuildContext context, Function(DateTime date) onConfirm,{DateTime initial,DateTime minDate}) {
    showRoundedDatePicker(
      context: context,
      initialDate: initial?? DateTime.now(),
      firstDate: minDate?? DateTime.now().add(Duration(days: -1)),
      lastDate: DateTime(2050),
      borderRadius: 16,
      height: 300,
      theme: ThemeData.light().copyWith(
        primaryColor:  MyColors.primary,
        accentColor: MyColors.black,
        buttonTheme: ButtonThemeData(
            textTheme: ButtonTextTheme.primary
        ),
      )
    ).then(onConfirm);
  }

  static _iosDatePicker(BuildContext context, Function(DateTime date) onConfirm,{DateTime initial,DateTime minDate}) {
    DatePicker.showDatePicker(context,
      showTitleActions: true,
      onConfirm: onConfirm,
      minTime: minDate?? DateTime.now(),
      currentTime: initial??DateTime.now(),
      theme: DatePickerTheme(
        itemStyle: GoogleFonts.roboto(fontSize: 18,color: MyColors.black)
      ),
      locale: LocaleType.en,
    );
  }


  static timePicker({@required BuildContext context, Function(DateTime date) onConfirm})async{
    if(Platform.isIOS){
      _iosTimePicker(context, onConfirm);
    }else{
      _androidTimePicker(context, onConfirm);
    }
  }

  static _androidTimePicker(BuildContext context, Function(DateTime date) onConfirm){
    var now = DateTime.now();
    showRoundedTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    ).then((time)=>onConfirm(DateTime(now.year, now.month, now.day, time.hour, time.minute)));
  }

  static _iosTimePicker(BuildContext context, Function(DateTime date) onConfirm){
    DatePicker.showTime12hPicker(context,
      showTitleActions: true,
      onConfirm: onConfirm,
      currentTime: DateTime.now(),
      theme: DatePickerTheme(
          itemStyle: GoogleFonts.roboto(fontSize: 18,color: MyColors.black)
      ),
      locale: LocaleType.en,
    );
  }

}