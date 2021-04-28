import 'package:base_flutter/general/blocks/lang_cubit/lang_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'CustomInputDecoration.dart';
import 'CustomInputTextStyle.dart';

class LabelTextField extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final EdgeInsets? margin;
  final bool isPassword;
  final TextInputType? type;
  final Function(String? value) validate;
  final Function()? onSubmit;
  final Function(String)? onChange;
  final TextInputAction? action;

  LabelTextField(
      {required this.label,
        required this.controller,
        this.onChange,
        this.margin,
        this.isPassword = false,
        this.action,
        this.onSubmit,
        this.type,
        required this.validate});

  @override
  _LabelTextFieldState createState() => _LabelTextFieldState();
}

class _LabelTextFieldState extends State<LabelTextField> {
  @override
  Widget build(BuildContext context) {
    var lang = context.watch<LangCubit>().state.locale.languageCode;
    return Container(
      margin: widget.margin ?? EdgeInsets.all(0),
      child: ConstrainedBox(
        constraints: BoxConstraints(
            minHeight: 50,
            maxHeight: 80,
            minWidth: double.infinity,
            maxWidth: double.infinity),
        child: TextFormField(
          controller: widget.controller,
          keyboardType: widget.type ?? TextInputType.text,
          obscureText: widget.isPassword,
          onEditingComplete: widget.onSubmit,
          onChanged: widget.onChange,
          enableSuggestions: false,
          autocorrect: false,
          textInputAction: widget.action ?? TextInputAction.next,
          validator: (value) => widget.validate(value),
          style: CustomInputTextStyle(lang: lang),
          decoration: CustomInputDecoration(lang: lang,label: widget.label),
        ),
      ),
    );
  }
}
