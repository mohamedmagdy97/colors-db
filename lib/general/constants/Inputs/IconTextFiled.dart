import 'package:flutter/material.dart';
import 'package:base_flutter/general/constants/MyColors.dart';
import 'package:google_fonts/google_fonts.dart';

class IconTextFiled extends StatelessWidget{

  final TextEditingController controller;
  final String label;
  final EdgeInsets margin;
  final TextInputType type;
  final Widget icon;
  final bool isPassword;
  final Widget prefix;
  final String prefixText;
  final Function(String value) validate;
  final Color filledColor;
  final TextInputAction action;
  final Function(String value) submit;
  final Function(String) onChange;

  IconTextFiled({this.label,this.controller,this.margin,this.type,this.action,this.submit,this.prefixText,
    this.icon,this.isPassword=false,this.prefix,this.filledColor,this.validate,this.onChange});


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin??EdgeInsets.all(0),
      child: ConstrainedBox(
        constraints: BoxConstraints(
            minHeight: 50,
            maxHeight: 80,
            minWidth: double.infinity,
            maxWidth: double.infinity
        ),
        child: TextFormField(
          controller: controller,
          keyboardType: type??TextInputType.text,
          enabled: true,
          obscureText: isPassword,
          textInputAction: action?? TextInputAction.done,
          onFieldSubmitted: submit,
          onChanged: onChange,
          style: GoogleFonts.roboto(fontSize: 20,color: Colors.black),
          validator: (value)=> validate(value),
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.withOpacity(.5),width: 1),
                  borderRadius: BorderRadius.circular(10)
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: MyColors.primary,width: 1)
              ),
              errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.withOpacity(.5),width: 1),
                  borderRadius: BorderRadius.circular(10)
              ),
              focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.red,width: 2)
              ),
              labelText: "$label",
              labelStyle: GoogleFonts.roboto(fontSize: 18),
              contentPadding: EdgeInsets.symmetric(horizontal: 10,vertical: 15),
            suffixIcon: icon,
            prefix: prefix,
            filled: true,
            fillColor: filledColor?? MyColors.white
          ),
        ),
      ),
    );
  }


}