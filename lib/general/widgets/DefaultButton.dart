import 'package:base_flutter/general/constants/MyColors.dart';
import 'package:flutter/material.dart';
import 'package:base_flutter/general/widgets/MyText.dart';


class DefaultButton extends StatelessWidget{

  final String title;
  final Function onTap;
  final Color textColor;
  final Color color;
  final Color borderColor;
  final BorderRadius borderRadius;
  final EdgeInsets margin;
  final double width;

  DefaultButton({@required this.title,@required this.onTap,
    this.color,this.textColor,this.borderRadius,this.margin,this.borderColor,this.width});

  @override
  Widget build(BuildContext context) {
    Color border=color??MyColors.primary;
    return Container(
        width: width?? MediaQuery.of(context).size.width,
        height: 45,
      margin: margin?? EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: ElevatedButton(
        onPressed: onTap,

        child: MyText(
          title: "$title",
          size: 11,
          color: textColor??MyColors.white,
        ),
        style: ElevatedButton.styleFrom(
          primary: color??MyColors.primary,
            shape: RoundedRectangleBorder(
                borderRadius: borderRadius?? BorderRadius.circular(10),
                side: BorderSide(color: borderColor??border,width: 1)
            ),
          elevation: 0
        ),
      ),
    );
  }

}