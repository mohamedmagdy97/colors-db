import 'package:base_flutter/general/constants/MyColors.dart';
import 'package:base_flutter/res.dart';
import 'package:flutter/material.dart';

class AuthScaffold extends StatelessWidget {
  final Widget child;

  AuthScaffold({
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: MyColors.white,
      body: Stack(
        children: [
          Image.asset(
            Res.bg,
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
          child,
        ],
      ),
    );
  }
}
