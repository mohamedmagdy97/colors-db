import 'package:google_fonts/google_fonts.dart';
import 'package:base_flutter/general/constants/MyColors.dart';
import 'package:flutter/material.dart';

class InkWellTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final EdgeInsets margin;
  final TextInputType type;
  final Widget icon;
  final Function onTab;
  final Icon prefix;
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
              validator: (value)=> validate(value),
              style: GoogleFonts.roboto(fontSize: 20, color: Colors.black),
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: borderColor ?? MyColors.grey, width: 1),
                    borderRadius: BorderRadius.circular(10)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                        color: MyColors.primary.withOpacity(.5), width: 1)),
                errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: borderColor ?? MyColors.grey.withOpacity(.5),
                        width: 1),
                    borderRadius: BorderRadius.circular(10)),
                focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.red, width: 2)),
                suffixIcon: icon,
                prefixIcon: prefix,
                errorStyle: GoogleFonts.roboto(fontSize: 14),
                labelText: " $label ",
                labelStyle: GoogleFonts.roboto(fontSize: 18),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
