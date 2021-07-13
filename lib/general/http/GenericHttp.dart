import 'package:base_flutter/general/blocks/lang_cubit/lang_cubit.dart';
import 'package:base_flutter/general/utilities/dio_helper/DioImports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum ReturnType { Model, List, Type }
enum MethodType { Get, Post, UploadFile }

class GenericHttp<T> {
  final BuildContext context;

  GenericHttp(this.context);

  Future<dynamic> callApi(
      {required String name,
      Map<String, dynamic> json = const {},
      required ReturnType returnType,
      required MethodType methodType,
      String? dataKey,
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
            dataKey: dataKey,
            toJsonFunc: toJsonFunc);
      case MethodType.Post:
        return _postData(
            name: name,
            returnType: returnType,
            json: json,
            showLoader: showLoader,
            dataKey: dataKey,
            toJsonFunc: toJsonFunc);
      case MethodType.UploadFile:
        return _uploadData(
            name: name,
            returnType: returnType,
            json: json,
            showLoader: showLoader,
            dataKey: dataKey,
            toJsonFunc: toJsonFunc);
    }
  }

  Future<dynamic> _getData({
    required String name,
    Map<String, dynamic> json = const {},
    required ReturnType returnType,
    String? dataKey,
    bool refresh = true,
    Function(dynamic data)? toJsonFunc,
  }) async {
    var data = await DioHelper(context: context, forceRefresh: refresh)
        .get(url: name, body: json);
    return _returnDataFromType(
        data, returnType, dataKey, toJsonFunc ?? (val) {});
  }

  Future<dynamic> _postData({
    required String name,
    Map<String, dynamic> json = const {},
    required ReturnType returnType,
    String? dataKey,
    bool? showLoader,
    Function(dynamic data)? toJsonFunc,
  }) async {
    var data = await DioHelper(
      context: context,
    ).post(url: name, body: json, showLoader: showLoader ?? true);
    return _returnDataFromType(
        data, returnType, dataKey, toJsonFunc ?? (val) {});
  }

  Future<dynamic> _uploadData({
    required String name,
    Map<String, dynamic> json = const {},
    required ReturnType returnType,
    String? dataKey,
    bool? showLoader,
    Function(dynamic data)? toJsonFunc,
  }) async {
    var data = await DioHelper(
      context: context,
    ).uploadFile(url: name, body: json, showLoader: showLoader ?? true);
    return _returnDataFromType(
        data, returnType, dataKey, toJsonFunc ?? (val) {});
  }

  dynamic _returnDataFromType(
    dynamic data,
    ReturnType returnType,
    String? dataKey,
    Function(dynamic data) toJsonFunc,
  ) async {
    switch (returnType) {
      case ReturnType.Type:
        return dataKey == null ? data : data[dataKey];
      case ReturnType.Model:
        return Function.apply(toJsonFunc, [data[dataKey ?? "data"]]);
      case ReturnType.List:
        return List<T>.from(
          data[dataKey ?? "data"].map(
            (e) => Function.apply(toJsonFunc, [e]),
          ),
        );
    }
  }
}
