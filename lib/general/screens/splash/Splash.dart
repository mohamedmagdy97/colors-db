import 'package:flutter/widgets.dart';
import 'package:base_flutter/general/constants/GlobalNotification.dart';
import 'package:base_flutter/general/utilities/utils_functions/UtilsImports.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:base_flutter/general/constants/MyColors.dart';
import 'package:base_flutter/general/widgets/AnimationContainer.dart';
import 'package:base_flutter/res.dart';


class Splash extends StatefulWidget {
  @override
  State<StatefulWidget> createState()=>_SplashState();
}

class _SplashState extends State<Splash> {

  GlobalKey<ScaffoldState> _scaffold = new GlobalKey<ScaffoldState>();


  @override
  void initState() {
    GlobalNotification.instance.setupNotification(context: context);
    Utils.manipulateSplashData(context);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffold,
      backgroundColor: MyColors.primary,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          alignment: Alignment.center,
          children: [

            AnimationContainer(
              distance: 500,
              index: 0,
              duration: Duration(seconds: 2),
              vertical: true,
              child: Image(
                width: 250,
                height: MediaQuery.of(context).size.width,
                image: AssetImage(Res.logoWhite),
                fit: BoxFit.contain,
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                height: 220,
                width: MediaQuery.of(context).size.width,
                child: Image(
                  image: AssetImage(Res.splash),
                  fit: BoxFit.fill,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}
