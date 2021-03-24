import 'package:flutter/material.dart';
import 'package:base_flutter/general/constants/MyColors.dart';

class ChatTextField extends StatelessWidget{

  final TextEditingController controller;
  final String label;
  final EdgeInsets margin;
  final TextInputType type;
  final Widget icon;
  final bool isPassword;
  final Icon prefix;
  final Function(String value) validate;
  final Color filledColor;
  final TextInputAction action;
  final Function() submit;
  ChatTextField({this.label,this.controller,this.margin,this.type,this.action,this.submit,
    this.icon,this.isPassword=false,this.prefix,this.filledColor,this.validate});


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin??EdgeInsets.all(0),
      child: ConstrainedBox(
        constraints: BoxConstraints(
            minHeight: 50,
            maxHeight: 50,
            minWidth: double.infinity,
            maxWidth: double.infinity
        ),
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
                style: TextStyle(fontSize: 16,fontFamily: "cairo",color: Colors.black.withOpacity(.7)),
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
                    hintText: "$label",
                    hintStyle: TextStyle(fontFamily: "cairo",fontSize: 14,color: Colors.black45),
                    contentPadding: EdgeInsets.symmetric(horizontal: 10,vertical: 14),
                    filled: true,
                    fillColor: filledColor?? MyColors.white
                ),
              ),
            ),
            IconButton(
              onPressed: submit,
              icon: Icon(Icons.send,size: 20,color: MyColors.black,),
            ),
          ],
        ),
      ),
    );
  }


}