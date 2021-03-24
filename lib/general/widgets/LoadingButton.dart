import 'package:base_flutter/general/constants/CustomButtonAnimation.dart';
import 'package:base_flutter/general/constants/MyColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'MyText.dart';


class LoadingButton extends StatelessWidget{

  final GlobalKey<CustomButtonState> btnKey;
  final String title;
  final Function() onTap;
  final Color textColor;
  final Color color;
  final Color borderColor;
  final double borderRadius;
  final EdgeInsets margin;
  final double width;
  final GlobalKey buttonKey;

  LoadingButton({@required this.title,@required this.onTap,
    this.color,this.textColor,this.borderRadius,this.margin,this.borderColor,this.width, this.buttonKey, this.btnKey});

  @override
  Widget build(BuildContext context) {
    Color border=color??MyColors.primary;
    return Container(
      margin: margin?? const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        children: [
          CustomButtonAnimation(
            key: btnKey,
            onTap: onTap,
            width: width?? MediaQuery.of(context).size.width,
            minWidth: 45,
            height: 45,
            color: color??MyColors.primary,
            borderRadius: borderRadius?? 10,
            borderSide: BorderSide(color: borderColor??border,width: 1),
            child: MyText(
              title: "$title",
              size: 11,
              color: textColor??MyColors.white,
            ),
            loader: Container(
              padding: EdgeInsets.all(10),
              child: SpinKitRotatingCircle(
                color: Colors.white,
                size: 20 ,
              ),
            ),

          ),
        ],
      ),
    );
  }

}