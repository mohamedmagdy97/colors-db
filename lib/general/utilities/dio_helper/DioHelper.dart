part of 'DioImports.dart';

class DioHelper {
  late Dio _dio;
  late DioCacheManager _manager;
  final bool forceRefresh;

  static String _baseUrl = "https://task.atc-servers.com/api/";
  late BuildContext context;

  DioHelper(BuildContext buildContext, {this.forceRefresh = true}) {
    context = buildContext;
    _dio = Dio(
      BaseOptions(
          baseUrl: _baseUrl,
          contentType: "application/x-www-form-urlencoded; charset=utf-8"),
    )
      ..interceptors.add(_getCacheManager().interceptor)
      ..interceptors.add(LogInterceptor(
          responseBody: true, logPrint: (data) => log(data.toString())));
  }

  DioCacheManager _getCacheManager() {
    _manager = DioCacheManager(
        CacheConfig(baseUrl: _baseUrl, defaultRequestMethod: "POST"));
    return _manager;
  }

  Options _buildCacheOptions(Map<String, dynamic> body, {bool subKey = true}) {
    return buildCacheOptions(Duration(days: 3),
        maxStale: Duration(days: 7),
        forceRefresh: forceRefresh,
        subKey: subKey ? json.encode(body) : "");
  }

  Future<dynamic> getGET(
    String url,
  ) async {
    // body.addAll({"fk_branch": "$_branch"});
    _dio.options.headers = await _getHeader();

    try {
      var response = await _dio.get(
        "$_baseUrl$url",
      );
      print("response ${response.statusCode}");
      var data = response.data;
      return data;
    } on DioError catch (e) {
      if (e.response?.statusCode == 422) {
        CustomToast.showToastNotification(
            e.response?.data["message"].toString());
      } else if (e.response?.statusCode == 401 ||
          e.response?.statusCode == 301) {
        CustomToast.showToastNotification(e.response?.data["error"].toString());
        tokenExpired();
      } else if (e.response?.statusCode == 403) {
        CustomToast.showToastNotification(e.response?.data["message"]);
      } else {
        CustomToast.showToastNotification(tr(context, "chickNet"));
      }
    }
    return null;
  }

  Future<dynamic> get(String url, Map<String, dynamic> body) async {
    // body.addAll({"fk_branch": "$_branch"});
    _printRequestBody(body);
    _dio.options.headers = await _getHeader();
    try {
      var response = await _dio.post("$_baseUrl$url",
          data: json.encode(body), options: _buildCacheOptions(body));
      print("response ${response.statusCode}");
      var data = response.data;
      return data;
    } on DioError catch (e) {
      if (e.response?.statusCode == 422) {
        CustomToast.showToastNotification(
            e.response?.data["message"].toString());
      } else if (e.response?.statusCode == 401 ||
          e.response?.statusCode == 301) {
        tokenExpired();
      } else if (e.response?.statusCode == 403) {
        CustomToast.showToastNotification(e.response?.data["error"].toString());
      } else if (e.response?.statusCode == 403) {
        CustomToast.showToastNotification(e.response?.data["message"]);
      } else {
        CustomToast.showToastNotification(tr(context, "chickNet"));
      }
    }
    return null;
  }

  Future<dynamic> post(String url, Map<String, dynamic> body,
      {bool showLoader = true}) async {
    // body.addAll({"fk_branch": "$_branch"});

    if (showLoader) LoadingDialog.showLoadingDialog();
    _printRequestBody(body);
    _dio.options.headers = await _getHeader();

    try {
      var response = await _dio.post("$_baseUrl$url", data: body);
      print("response ${response.statusCode}");
      if (showLoader) EasyLoading.dismiss();
      print('^%%%%%%%%%%%${response.data["responseCode"]}');
      if (response.data["responseCode"] == 2) {
        // print('loooool::${response.data["dateSet"][0].toString()}');
        print('loooool::${response.data["responseMessage"].toString()}');
        return CustomToast.showSimpleToast(
            msg: response.data["responseMessage"].toString());
      }
      var data = response.data;
      return data;
    } on DioError catch (e) {
      if (showLoader) EasyLoading.dismiss();
      print('>>>COOOOde>>>>>>>>>>${e.response?.statusCode}');
      if (e.response?.statusCode == 200 &&
          e.response?.data["responseCode"] == 2) {
        Map<String, dynamic> errors = e.response?.data["dateSet"];
        print("______________$errors");
        errors.forEach((key, value) {
          List<String> lst = List<String>.from(value.map((e) => e));
          lst.forEach((e) {
            CustomToast.showSimpleToast(msg: e);
          });
        });
      }
      if (e.response?.statusCode == 422 ||
          e.response?.statusCode == 403 ||
          e.response?.statusCode == 400) {
        print('>>>ERRRRRRRRRRRRO>>>>>>>>>>${e.response?.data}');
        print('>>>ERRRRRRRRRRRRO>>>>>>>>>>${e.response?.data["dateSet"]}');

        if (e.response?.data["dateSet"] != null) {
          Map<String, dynamic> errors = e.response?.data["dateSet"];
          print("______________$errors");
          errors.forEach((key, value) {
            List<String> lst = List<String>.from(value.map((e) => e));
            lst.forEach((e) {
              CustomToast.showSimpleToast(msg: e);
            });
          });
        } else if (e.response?.data["error"] != null) {
          CustomToast.showToastNotification(
              tr(context, e.response?.data["error"]));
        } else {
          CustomToast.showToastNotification(
              e.response?.data["responseMessage"].toString());
        }
      } else if (e.response?.statusCode == 401 ||
          e.response?.statusCode == 301) {
        tokenExpired();
      } else if (e.response?.statusCode == 403) {
        CustomToast.showSimpleToast(msg: e.response?.data["responseMessage"]);
      } else {
        CustomToast.showSimpleToast(msg: tr(context, "chickNet"));
      }
    }

    return null;
  }

  Future<dynamic> postToken(String url, Map<String, dynamic> body,
      {bool showLoader = true}) async {
    // body.addAll({"fk_branch": "$_branch"});

    if (showLoader) LoadingDialog.showLoadingDialog();
    _printRequestBody(body);
    _dio.options.headers = await _getHeader();

    try {
      var response = await _dio.post("$_baseUrl$url",
          data: FormData.fromMap(body), options: _buildCacheOptions(body));
      print("response ${response.statusCode}");
      if (showLoader) EasyLoading.dismiss();
      // response.data["msg"] == null
      //     ? null
      //     : CustomToast.showToastNotification(
      //         response.data["msg"].toString());
      var data = response.data;
      return data;
    } on DioError catch (e) {
      if (showLoader) EasyLoading.dismiss();
      if (e.response?.statusCode == 422) {
        // CustomToast.showToastNotification(
        //     e.response.data["message"].toString());
      } else if (e.response?.statusCode == 401 ||
          e.response?.statusCode == 301) {
        tokenExpired();
      } else if (e.response?.statusCode == 403) {
         CustomToast.showSimpleToast(msg: e.response?.data["responseMessage"]);

      } else {
        // CustomToast.showToastNotification(tr("chickNet"));
      }
    }

    return null;
  }

  Future<dynamic> patch(String url, Map<String, dynamic> body,
      {bool showLoader = true}) async {
    // body.addAll({"fk_branch": "$_branch"});

    if (showLoader) LoadingDialog.showLoadingDialog();
    _printRequestBody(body);
    _dio.options.headers = await _getHeader();

    try {
      var response = await _dio.patch("$_baseUrl$url",
          data: FormData.fromMap(body), options: _buildCacheOptions(body));
      print("response ${response.statusCode}");
      if (showLoader) EasyLoading.dismiss();
      response.data["msg"] == null
          ? null
          : CustomToast.showToastNotification(response.data["msg"].toString());
      var data = response.data;
      return data;
    } on DioError catch (e) {
      if (showLoader) EasyLoading.dismiss();
      if (e.response?.statusCode == 422) {
        CustomToast.showToastNotification(
            e.response?.data["message"].toString());
      } else if (e.response?.statusCode == 401 ||
          e.response?.statusCode == 301) {
        tokenExpired();
      } else if (e.response?.statusCode == 403) {
        CustomToast.showToastNotification(e.response?.data["responseMessage"]);
      } else {
        CustomToast.showToastNotification(tr(context, "chickNet"));
      }
    }

    return null;
  }

  Future<dynamic> uploadFile(String url, Map<String, dynamic> body,
      {bool showLoader = true}) async {
    // body.addAll({"fk_branch": "$_branch"});

    if (showLoader) LoadingDialog.showLoadingDialog();
    _printRequestBody(body);
    FormData formData = FormData.fromMap(body);
    body.forEach((key, value) async {
      if ((value) is File) {
        //create multipart using filepath, string or bytes
        MapEntry<String, MultipartFile> pic = MapEntry(
          "$key",
          MultipartFile.fromFileSync(value.path,
              filename: value.path.split("/").last),
        );
        //add multipart to request
        formData.files.add(pic);
      } else if ((value) is List<File>) {
        List<MapEntry<String, MultipartFile>> files = [];
        value.forEach((element) async {
          MapEntry<String, MultipartFile> pic = MapEntry(
              "$key",
              MultipartFile.fromFileSync(
                element.path,
                filename: element.path.split("/").last,
              ));
          files.add(pic);
        });
        formData.files.addAll(files);
      } else {
        // requestData.addAll({"$key":"$value"});

      }
    });

    _dio.options.headers = await _getHeader();
    //create multipart request for POST or PATCH method

    try {
      var response = await _dio.post("$_baseUrl$url",
          data: formData, options: _buildCacheOptions(body, subKey: false));
      print("response ${response.data}");
      if (showLoader) EasyLoading.dismiss();
      if (response.statusCode! >= 200 || response.statusCode! <= 300) {
        return response.data;
      } else {
        response.data["message"] == null
            ? null
            : CustomToast.showToastNotification(
                response.data["message"].toString());
        return null;
      }
    } on DioError catch (e) {
      if (showLoader) EasyLoading.dismiss();
      if (e.response?.statusCode == 422) {
        CustomToast.showToastNotification(
            e.response?.data["message"].toString());
      } else if (e.response?.statusCode == 401 ||
          e.response?.statusCode == 301) {
        tokenExpired();
      } else {
        // CustomToast.showToastNotification(tr("chickNet"));
      }
    }

    return null;
  }

  Future<dynamic> uploadFilePut(String url, Map<String, dynamic> body,
      {bool showLoader = true}) async {
    // body.addAll({"fk_branch": "$_branch"});

    if (showLoader) LoadingDialog.showLoadingDialog();
    _printRequestBody(body);
    FormData formData = FormData.fromMap(body);
    body.forEach((key, value) async {
      if ((value) is File) {
        //create multipart using filepath, string or bytes
        MapEntry<String, MultipartFile> pic = MapEntry(
          "$key",
          MultipartFile.fromFileSync(value.path,
              filename: value.path.split("/").last),
        );
        //add multipart to request
        formData.files.add(pic);
      } else if ((value) is List<File>) {
        List<MapEntry<String, MultipartFile>> files = [];
        value.forEach((element) async {
          MapEntry<String, MultipartFile> pic = MapEntry(
              "$key",
              MultipartFile.fromFileSync(
                element.path,
                filename: element.path.split("/").last,
              ));
          files.add(pic);
        });
        formData.files.addAll(files);
      } else {
        // requestData.addAll({"$key":"$value"});

      }
    });

    _dio.options.headers = await _getHeader();
    //create multipart request for POST or PATCH method

    try {
      var response = await _dio.put("$_baseUrl$url",
          data: formData, options: _buildCacheOptions(body, subKey: false));
      print("response ${response.statusCode}");
      if (showLoader) EasyLoading.dismiss();
      if (response.statusCode! >= 200 || response.statusCode! <= 300) {
        return response.data;
      } else {
        CustomToast.showToastNotification(response.data["message"].toString());
        return null;
      }
    } on DioError catch (e) {
      if (showLoader) EasyLoading.dismiss();
      if (e.response?.statusCode == 422) {
        CustomToast.showToastNotification(
            e.response?.data["message"].toString());
      } else if (e.response?.statusCode == 401 ||
          e.response?.statusCode == 301) {
        tokenExpired();
      } else if (e.response?.statusCode == 403) {
        CustomToast.showToastNotification(e.response?.data["message"]);
      } else {
        // CustomToast.showToastNotification(tr("chickNet"));
      }
    }

    return null;
  }

  void _printRequestBody(Map<String, dynamic> body) {
    print(
        "-------------------------------------------------------------------");
    print(body);
    print(
        "-------------------------------------------------------------------");
  }

  _getHeader() async {
    String token = GlobalState.instance.get("token");
    final pref = await SharedPreferences.getInstance();
    return {
      "Accept": "application/json",
      "Content-Type": "application/json",
      // "Client-Secret": _secretKey,
      "Authorization": "Bearer $token",
      "Locale": pref.get("lang") ?? "ar"
    };
  }

  void tokenExpired() {
    // CustomToast.showToastNotification(tr("accountIsNotValid"));
    Future.delayed(Duration(seconds: 1), (() {
      Utils.clearSavedData();
      AutoRouter.of(context).pushAndPopUntil(
        LoginRoute(),
        predicate: (Route<dynamic> route) => false,
      );
    }));
  }
}
