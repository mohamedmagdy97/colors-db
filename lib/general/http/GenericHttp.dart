import 'package:base_flutter/general/blocks/lang_cubit/lang_cubit.dart';
import 'package:base_flutter/general/utilities/dio_helper/DioImports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum ReturnType { Model, List, Type }
enum MethodType { Get, Post, UploadFile }

class GenericHttp<T>{
  final BuildContext context;

  GenericHttp(this.context);

  Future<dynamic> callApi(
      {required ReturnType returnType,
      required MethodType methodType,
      required String name,
      Function(dynamic data)? returnDataFun,
      Map<String, dynamic> json = const {},
      bool? showLoader,
      Function(dynamic data)? toJsonFunc,
      bool refresh = true}) async {
    json.addAll({"lang": context.read<LangCubit>().state.locale.languageCode});

    switch (methodType) {
      case MethodType.Get:
        return _getData(
            name: name,
            returnType: returnType,
            json: json,
            refresh: refresh,
            dataKeyFun: returnDataFun,
            toJsonFunc: toJsonFunc);
      case MethodType.Post:
        return _postData(
            name: name,
            returnType: returnType,
            json: json,
            showLoader: showLoader,
            dataKeyFun: returnDataFun,
            toJsonFunc: toJsonFunc);
      case MethodType.UploadFile:
        return _uploadData(
            name: name,
            returnType: returnType,
            json: json,
            showLoader: showLoader,
            dataKeyFun: returnDataFun,
            toJsonFunc: toJsonFunc);
    }
  }

  Future<dynamic> _getData({
    required ReturnType returnType,
    required String name,
    Function(dynamic data)? dataKeyFun,
    Map<String, dynamic> json = const {},
    bool refresh = true,
    Function(dynamic data)? toJsonFunc,
  }) async {
    var data = await DioHelper(context: context, forceRefresh: refresh)
        .get(url: name, body: json);
    return _returnDataFromType(
        data, returnType, toJsonFunc ?? (val) {},dataKeyFun);
  }

  Future<dynamic> _postData({
    required ReturnType returnType,
    required String name,
    Function(dynamic data)? dataKeyFun,
    Map<String, dynamic> json = const {},
    bool? showLoader,
    Function(dynamic data)? toJsonFunc,
  }) async {
    var data = await DioHelper(
      context: context,
    ).post(url: name, body: json, showLoader: showLoader ?? true);
    return _returnDataFromType(
        data, returnType, toJsonFunc ?? (val) {},dataKeyFun);
  }

  Future<dynamic> _uploadData({
    required ReturnType returnType,
    required String name,
    Function(dynamic data)?  dataKeyFun,
    Map<String, dynamic> json = const {},
    bool? showLoader,
    Function(dynamic data)? toJsonFunc,
  }) async {
    var data = await DioHelper(
      context: context,
    ).uploadFile(url: name, body: json, showLoader: showLoader ?? true);
    return _returnDataFromType(
        data, returnType, toJsonFunc ?? (val) {},dataKeyFun);
  }

  dynamic _returnDataFromType(
    dynamic data,
    ReturnType returnType,
    Function(dynamic data) toJsonFunc,
    Function(dynamic data)? dataKeyFun,
  ) async {
    switch (returnType) {
      case ReturnType.Type:
        return dataKeyFun==null?data : Function.apply(dataKeyFun, [data]);
      case ReturnType.Model:
        return  Function.apply(toJsonFunc, [dataKeyFun==null?data:
          Function.apply(dataKeyFun, [data]) as T
        ]);
      case ReturnType.Model:
        return ;
      case ReturnType.List:
        return List<T>.from(
          dataKeyFun==null?data: Function.apply(dataKeyFun, [data]).map(
            (e) => Function.apply(toJsonFunc, [e]),
          ),
        );
    }
  }
}
