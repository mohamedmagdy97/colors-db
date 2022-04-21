import 'package:flutter/material.dart';
import 'package:base_flutter/res.dart';

class HeaderLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const EdgeInsets.symmetric(vertical: 50),
      child: Image(
        height: 100,
        width: 100,
        image: AssetImage(Res.logo),
        fit: BoxFit.contain,
      ),
    );
  }
}
