import 'package:auto_route/auto_route.dart';
import 'package:base_flutter/general/constants/MyColors.dart';
import 'package:tf_custom_widgets/tf_custom_widgets.dart';
import 'package:flutter/material.dart';

class AuthHeaderText extends StatelessWidget {
  final String title;
  final bool showBack;

  const AuthHeaderText({required this.title, this.showBack=true});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MyText(
            title: title,
            size: 17,
            color: MyColors.primary,
          ),
          Offstage(
            offstage: !showBack,
            child: IconButton(
                icon: Icon(
                  Icons.arrow_forward,
                  color: MyColors.black,
                  size: 25,
                ),
                onPressed: ()=> AutoRouter.of(context).pop(),
            ),
          )
        ],
      ),
    );
  }
}
