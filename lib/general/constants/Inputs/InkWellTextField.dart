import 'package:base_flutter/general/blocks/lang_cubit/lang_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'CustomInputDecoration.dart';
import 'CustomInputTextStyle.dart';

class InkWellTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final EdgeInsets margin;
  final TextInputType type;
  final Widget icon;
  final Function onTab;
  final Widget prefix;
  final Color borderColor;
  final Function(String value) validate;

  InkWellTextField(
      {this.label,
        this.controller,
        this.margin,
        this.type,
        this.onTab,
        this.icon,
        this.prefix,
        this.borderColor,
        this.validate});

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
        child: InkWell(
          onTap: onTab,
          child: AbsorbPointer(
            child: TextFormField(
              controller: controller,
              keyboardType: type ?? TextInputType.text,
              enabled: true,
              validator: (value) => validate(value),
              style: CustomInputTextStyle(lang: lang),
              decoration: CustomInputDecoration(lang: lang,label: label,prefixIcon: prefix,suffixIcon: icon),
            ),
          ),
        ),
      ),
    );
  }
}