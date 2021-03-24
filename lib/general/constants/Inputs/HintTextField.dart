import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:base_flutter/general/constants/MyColors.dart';
import 'package:flutter/material.dart';

class HintTextField extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final EdgeInsets margin;
  final bool isPassword;
  final TextInputType type;
  final Function(String value) validate;
  final Function() onSubmit;
  final TextInputAction action;

  HintTextField({this.label,this.controller,
    this.margin,this.isPassword=false,this.action,this.onSubmit,
    this.type=TextInputType.text,this.validate});
  @override
  _HintTextFieldState createState() => _HintTextFieldState();
}

class _HintTextFieldState extends State<HintTextField> {

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
          enableSuggestions: false,
          autocorrect: false,
          textInputAction: widget.action?? TextInputAction.next,
          style: GoogleFonts.cairo(fontSize: 14,color: Colors.black.withOpacity(.7)),
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
              errorStyle: GoogleFonts.abel(fontSize: 12),
              hintText: "  ${widget.label}  ",
              helperStyle: GoogleFonts.cairo(fontSize: 14),
              contentPadding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              filled: true,
              fillColor: Colors.white
          ),
        ),
      ),
    );
  }
}
