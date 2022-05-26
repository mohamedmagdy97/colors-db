
import 'package:colors_db/general/constants/MyColors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomInputTextStyle extends TextStyle{

  final Color? textColor;

  CustomInputTextStyle({this.textColor});


  @override
  String get fontFamily => GoogleFonts.josefinSans().fontFamily!;

  @override
  // TODO: implement fontSize
  double get fontSize => 16;

  @override
  // TODO: implement color
  Color get color => textColor??MyColors.black;

}