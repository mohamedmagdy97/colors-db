import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:base_flutter/general/constants/MyColors.dart';

class LoadingDialog {
  static showLoadingDialog() {
    EasyLoading.show(
        maskType: EasyLoadingMaskType.black,
        dismissOnTap: false,
        indicator: SpinKitCubeGrid(
          size: 40.0,
          itemBuilder: (context, index) {
            return Container(
              height: 10,
              width: 10,
              margin: EdgeInsets.all(1),
              decoration: BoxDecoration(
                  color: MyColors.primary, shape: BoxShape.circle),
            );
          },
        ),
        status: "loading");
  }

  static showLoadingView({Color? color}) {
    return Center(
      child: SpinKitCubeGrid(
        color: color?? MyColors.primary,
        size: 40.0,
      ),
    );
  }
}
