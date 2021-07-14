import 'package:base_flutter/general/blocks/lang_cubit/lang_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'text_field_style/CustomInputDecoration.dart';
import 'text_field_style/CustomInputTextStyle.dart';

class GenericTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? label;
  final String? hint;
  final int? max;
  final EdgeInsets? margin;
  final TextInputType type;
  final TextInputAction action;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Function()? onTab;
  final Color? enableBorderColor;
  final Function(String? value) validate;
  final FieldTypes fieldTypes;
  final Function()? onSubmit;
  final Function(String)? onChange;

  GenericTextField(
      { this.label,
       this.hint,
      required this.fieldTypes,
      this.controller,
      this.margin,
      required this.type,
      this.onTab,
      this.max,
      this.prefixIcon,
      this.suffixIcon,
      this.onChange,
      this.onSubmit,
      required this.action,
      this.enableBorderColor,
      required this.validate});

  @override
  Widget build(BuildContext context) {
    var lang = context.watch<LangCubit>().state.locale.languageCode;
    return Container(
      margin: margin ?? EdgeInsets.all(0),
      child: InkWell(
        onTap: onTab,
        child: AbsorbPointer(
          absorbing: fieldTypes==FieldTypes.clickable,
          child: TextFormField(
            controller: controller,
            keyboardType: type ,
            textInputAction: action,
            enableSuggestions: false,
            autocorrect: false,
            enabled: true,
            maxLines: fieldTypes==FieldTypes.chat? null: fieldTypes==FieldTypes.rich? max :1,
            obscureText: fieldTypes==FieldTypes.password,
            readOnly: fieldTypes==FieldTypes.readonly,
            onEditingComplete: onSubmit,
            onChanged: onChange,
            validator: (value) => validate(value),
            style: CustomInputTextStyle(lang: lang),
            decoration: CustomInputDecoration(
              lang: lang,
              label: label,
              hint: hint,
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
              enableColor: enableBorderColor
            ),
          ),
        ),
      ),
    );
  }

  BoxConstraints getConstrains(FieldTypes type){
    if (type==FieldTypes.chat) {
      return BoxConstraints.tightFor(height: 100);
    }
    return BoxConstraints(
      minHeight: 50,
      maxHeight: 80,
      minWidth: double.infinity,
      maxWidth: double.infinity,
    );
  }

}

enum FieldTypes { normal, clickable, readonly, chat, password,rich}
