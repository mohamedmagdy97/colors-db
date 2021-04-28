import 'package:base_flutter/general/blocks/lang_cubit/lang_cubit.dart';
import 'package:flutter/material.dart';
import 'package:base_flutter/general/constants/MyColors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'CustomInputDecoration.dart';
import 'CustomInputTextStyle.dart';

class ChatTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final EdgeInsets? margin;
  final TextInputType? type;
  final Widget? icon;
  final bool isPassword;
  final Icon? prefix;
  final Color? filledColor;
  final TextInputAction? action;
  final Function()? submit;

  ChatTextField({
    required this.label,
    required this.controller,
    this.margin,
    this.type,
    this.action,
    this.submit,
    this.icon,
    this.isPassword = false,
    this.prefix,
    this.filledColor,
  });

  @override
  Widget build(BuildContext context) {
    var lang = context.watch<LangCubit>().state.locale.languageCode;
    return Container(
      margin: margin ?? EdgeInsets.all(0),
      child: ConstrainedBox(
        constraints: BoxConstraints(
            minHeight: 50,
            maxHeight: 50,
            minWidth: double.infinity,
            maxWidth: double.infinity),
        child: Row(
          children: [
            Flexible(
              child: TextFormField(
                controller: controller,
                keyboardType: TextInputType.multiline,
                enabled: true,
                obscureText: isPassword,
                textInputAction: TextInputAction.newline,
                maxLines: 10,
                minLines: 8,
                style: CustomInputTextStyle(lang: lang),
                decoration: CustomInputDecoration(lang: lang, label: label),
              ),
            ),
            IconButton(
              onPressed: submit,
              icon: Icon(
                Icons.send,
                size: 20,
                color: MyColors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
