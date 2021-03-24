import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:base_flutter/general/constants/MyColors.dart';
import 'package:flutter/material.dart';

class LabelTextField extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final EdgeInsets margin;
  final bool isPassword;
  final TextInputType type;
  final Function(String value) validate;
  final Function() onSubmit;
  final Function(String) onChange;
  final TextInputAction action;

  LabelTextField({this.label,this.controller,this.onChange,
    this.margin,this.isPassword=false,this.action,this.onSubmit,
    this.type=TextInputType.text,this.validate});
  @override
  _LabelTextFieldState createState() => _LabelTextFieldState();
}

class _LabelTextFieldState extends State<LabelTextField> {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin??EdgeInsets.all(0),
      child: ConstrainedBox(
        constraints: BoxConstraints(
            minHeight: 50,
            maxHeight: 80,
            minWidth: double.infinity,
            maxWidth: double.infinity
        ),
        child: TextFormField(
          controller: widget.controller,
          keyboardType: widget.type?? TextInputType.text,
          obscureText: widget.isPassword,
          onEditingComplete: widget.onSubmit,
          onChanged: widget.onChange,
          enableSuggestions: false,
          autocorrect: false,
          textInputAction: widget.action?? TextInputAction.next,
          style: GoogleFonts.roboto(fontSize: 20,color: Colors.black),
          validator: (value)=> widget.validate(value),
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: MyColors.grey.withOpacity(.8),width: 1),
                  borderRadius: BorderRadius.circular(10)
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: MyColors.primary,width: 2)
              ),
              errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: MyColors.grey.withOpacity(.5),width: 1),
                  borderRadius: BorderRadius.circular(10)
              ),
              focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.red,width: 2)
              ),
              errorStyle: GoogleFonts.roboto(fontSize: 14),
              labelText: "  ${widget.label}  ",
              labelStyle: GoogleFonts.roboto(fontSize: 18),
              contentPadding: EdgeInsets.symmetric(horizontal: 10,vertical: 15),
              filled: true,
              fillColor: Colors.white,
          ),
        ),
      ),
    );
  }
}
