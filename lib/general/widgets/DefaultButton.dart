import 'package:base_flutter/general/constants/MyColors.dart';
import 'package:flutter/material.dart';
import 'package:base_flutter/general/widgets/MyText.dart';


// ignore: must_be_immutable
class DefaultButton extends StatelessWidget{

  String title;
  Function onTap;
  Color textColor;
  Color color;
  Color borderColor;
  BorderRadius borderRadius;
  EdgeInsets margin;
  double width;

  DefaultButton({@required this.title,@required this.onTap,
    this.color,this.textColor,this.borderRadius,this.margin,this.borderColor,this.width});

  @override
  Widget build(BuildContext context) {
    Color border=color??MyColors.primary;
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width?? MediaQuery.of(context).size.width,
        height: 45,
        margin: margin?? EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          color: color??MyColors.primary,
          borderRadius: borderRadius?? BorderRadius.circular(10),
          border: Border.all(color: borderColor??border,width: 1)
        ),
        alignment: Alignment.center,
        child: MyText(
          title: "$title",
          size: 11,
          color: textColor??MyColors.white,
        ),
      ),
    );
  }

}