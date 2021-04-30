import 'package:base_flutter/general/constants/MyColors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomInputDecoration extends InputDecoration {
  final String lang;
  final String? label;
  final String? hint;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Color? enableColor;
  final Color? focusColor;
  final double? borderRaduis;
  final EdgeInsets? padding;

  CustomInputDecoration({
    required this.lang,
    this.hint,
    this.label,
    this.prefixIcon,
    this.suffixIcon,
    this.enableColor,
    this.focusColor,
    this.borderRaduis,
    this.padding
  }) : super();

  @override
  // TODO: implement enabledBorder
  InputBorder get enabledBorder => OutlineInputBorder(
    borderSide: BorderSide(color: enableColor ?? MyColors.white, width: .5),
    borderRadius: BorderRadius.circular(borderRaduis??10),
  );

  @override
  // TODO: implement focusedBorder
  InputBorder get focusedBorder => OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRaduis??10),
      borderSide: BorderSide(color: focusColor ?? MyColors.white, width: 1));

  @override
  // TODO: implement errorBorder
  InputBorder get errorBorder => OutlineInputBorder(
      borderSide: BorderSide(color: enableColor ?? MyColors.white, width: .5),
      borderRadius: BorderRadius.circular(borderRaduis??10));

  @override
  // TODO: implement focusedErrorBorder
  InputBorder get focusedErrorBorder => OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRaduis??10),
      borderSide: BorderSide(color: Colors.red, width: 2));

  @override
  // TODO: implement errorStyle
  TextStyle get errorStyle => lang != "ar"
      ? GoogleFonts.roboto(fontSize: 12)
      : GoogleFonts.cairo(fontSize: 10);

  @override
  // TODO: implement hintText
  String? get hintText => hint;

  @override
  // TODO: implement labelText
  String? get labelText => label;

  @override
  // TODO: implement labelStyle
  TextStyle get labelStyle => lang != "ar"
      ? GoogleFonts.roboto(fontSize: 16)
      : GoogleFonts.cairo(fontSize: 14);

  @override
  // TODO: implement hintStyle
  TextStyle? get hintStyle => lang != "ar"
      ? GoogleFonts.roboto(fontSize: 16)
      : GoogleFonts.cairo(fontSize: 14);

  @override
  // TODO: implement contentPadding
  EdgeInsetsGeometry get contentPadding =>
      padding?? EdgeInsets.symmetric(horizontal: 10, vertical: 18);

  @override
  // TODO: implement filled
  bool get filled => true;

  @override
  // TODO: implement fillColor
  Color get fillColor => MyColors.white;

  @override
  // TODO: implement alignLabelWithHint
  bool get alignLabelWithHint => true;
}
