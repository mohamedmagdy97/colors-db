import 'package:base_flutter/general/blocks/lang_cubit/lang_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:base_flutter/general/constants/MyColors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'CustomInputDecoration.dart';
import 'CustomInputTextStyle.dart';

class RichTextFiled extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final EdgeInsets margin;
  final TextInputType type;
  final int min, max;
  final double height;
  final Function(String value) validate;
  final Color fillColor;
  final bool readOnly;
  final TextInputAction action;
  final Function(String value) submit;

  RichTextFiled(
      {this.label,
        this.hint,
        this.controller,
        this.margin = const EdgeInsets.all(0),
        this.type = TextInputType.text,
        this.max,
        this.min,
        this.height,
        this.validate,
        this.fillColor,
        this.readOnly = false,
        this.action,
        this.submit});

  @override
  Widget build(BuildContext context) {
    var lang = context.watch<LangCubit>().state.locale.languageCode;
    return Container(
      height: height,
      margin: margin,
      child: TextFormField(
        controller: controller,
        keyboardType: type ?? TextInputType.multiline,
        textInputAction: action ?? TextInputAction.done,
        onFieldSubmitted: submit,
        minLines: min,
        maxLines: max,
        readOnly: readOnly,
        validator: (value) => validate(value),
        style: CustomInputTextStyle(lang: lang),
        decoration: CustomInputDecoration(lang: lang,label: label),
      ),
    );
  }
}
