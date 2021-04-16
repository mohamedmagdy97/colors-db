import 'package:base_flutter/general/blocks/lang_cubit/lang_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'CustomInputDecoration.dart';
import 'CustomInputTextStyle.dart';

class IconTextFiled extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final EdgeInsets margin;
  final TextInputType type;
  final Widget suffixIcon;
  final bool isPassword;
  final Widget prefixIcon;
  final String prefixText;
  final Function(String value) validate;
  final Color filledColor;
  final TextInputAction action;
  final Function(String value) submit;
  final Function(String) onChange;

  IconTextFiled(
      {this.label,
        this.controller,
        this.margin,
        this.type,
        this.action,
        this.submit,
        this.prefixText,
        this.suffixIcon,
        this.isPassword = false,
        this.prefixIcon,
        this.filledColor,
        this.validate,
        this.onChange});

  @override
  Widget build(BuildContext context) {
    var lang = context.watch<LangCubit>().state.locale.languageCode;
    return Container(
      margin: margin ?? EdgeInsets.all(0),
      child: ConstrainedBox(
        constraints: BoxConstraints(
            minHeight: 50,
            maxHeight: 80,
            minWidth: double.infinity,
            maxWidth: double.infinity),
        child: TextFormField(
          controller: controller,
          keyboardType: type ?? TextInputType.text,
          enabled: true,
          obscureText: isPassword,
          textInputAction: action ?? TextInputAction.done,
          onFieldSubmitted: submit,
          onChanged: onChange,
          validator: (value) => validate(value),
          style: CustomInputTextStyle(lang: lang),
          decoration: CustomInputDecoration(lang: lang,label: label,prefix: prefixIcon,suffix: suffixIcon,),
        ),
      ),
    );
  }
}
