import 'dart:io';
import 'package:base_flutter/general/models/HomeDetailsModel.dart';
import 'package:base_flutter/general/models/HomeModel.dart';
import 'package:base_flutter/general/models/QuestionModel.dart';
import 'package:base_flutter/general/models/RegisterModel.dart';
import 'package:base_flutter/general/utilities/dio_helper/DioImports.dart';
import 'package:base_flutter/general/utilities/utils_functions/ApiNames.dart';
import 'package:base_flutter/general/models/UserModel.dart';
import 'package:base_flutter/general/utilities/utils_functions/UtilsImports.dart';
import 'package:dio_helper/http/GenericHttp.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

part 'GeneralRepository.dart';
part 'GeneralHttpMethods.dart';