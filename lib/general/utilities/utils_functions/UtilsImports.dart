import 'dart:convert';
import 'package:base_flutter/general/blocks/user_cubit/user_cubit.dart';
import 'package:base_flutter/general/constants/MyColors.dart';
import 'package:base_flutter/general/constants/input_field_style/CustomInputDecoration.dart';
import 'package:base_flutter/general/constants/input_field_style/CustomInputTextStyle.dart';
import 'package:base_flutter/general/utilities/utils_functions/ApiNames.dart';
import 'package:dio_helper/dio_helper.dart';
import 'package:tf_custom_widgets/tf_custom_widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'LoadingDialog.dart';
import 'package:base_flutter/general/models/UserModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:base_flutter/general/utilities/routers/RouterImports.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'utils.dart';

