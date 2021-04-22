part of 'DioImports.dart';

class DioHelper {
  Dio _dio;
  final baseUrl = "https://hiraj.ip4s.com";
  final String _branch = "6";
  CacheStore cacheStore;
  CacheOptions options;

  Future<void> intiDio()async{
    if (_dio == null) {
      var dir = await pp.getApplicationDocumentsDirectory();
      cacheStore = DbCacheStore(databasePath: dir.path, logStatements: true);
      // cacheStore = FileCacheStore(dir.path);
      _dio = Dio(
        BaseOptions(
            baseUrl: baseUrl,
            contentType: "application/x-www-form-urlencoded; charset=utf-8"),
      )
        ..interceptors.add(
          DioCacheInterceptor(options: _buildCacheOptions(cacheStore)),
        )
      ..interceptors.add(PrettyDioLogger(requestHeader: true,requestBody: true));
    }
  }

  CacheOptions _buildCacheOptions(CacheStore cacheDb) {
    options = CacheOptions(
      store:  cacheDb,
      policy: CachePolicy.refresh,
      hitCacheOnErrorExcept: [401, 403],
      priority: CachePriority.high,
      maxStale: const Duration(days: 7),
    );
    return options;
  }

  Future<dynamic> get({String url, Map<String, dynamic> body, BuildContext context, bool refresh = true}) async {
    body.addAll({"branchId": _branch});
    _dio.options.headers = await _getHeader();
    try {
      var response = await _dio.post("$baseUrl$url", data: FormData.fromMap(body),
          options: options.copyWith(policy: refresh? CachePolicy.refresh:CachePolicy.refresh).toOptions());
      var data = response.data;
      if (data["key"] == 1) {
        return data;
      } else {
        LoadingDialog.showToastNotification(data["msg"].toString());
      }
    } on DioError catch (e) {
      if (e.response.statusCode == 401 || e.response.statusCode == 301|| e.response.statusCode == 302) {
        logout(context);
      } else {
        LoadingDialog.showToastNotification(tr(context, "chickNet"));
      }
    }
    return null;
  }

  Future<dynamic> post({String url, Map<String, dynamic> body, BuildContext context, bool showLoader = true}) async {
    if(showLoader)LoadingDialog.showLoadingDialog();
    body.addAll({"branchId": _branch});
    _dio.options.headers = await _getHeader();
    try {
      var response =
          await _dio.post("$baseUrl$url", data: FormData.fromMap(body));
      if(showLoader)EasyLoading.dismiss();
      LoadingDialog.showToastNotification(response.data["msg"].toString());
      if (response.data["key"] == 1) return response.data;
    } on DioError catch (e) {
      if(showLoader)EasyLoading.dismiss();
      if (e.response.statusCode == 401 || e.response.statusCode == 301|| e.response.statusCode == 302) {
        logout(context);
      } else {
        LoadingDialog.showToastNotification(tr(context, "chickNet"));
      }
    }

    return null;
  }

  Future<dynamic> uploadFile({String url, Map<String, dynamic> body, BuildContext context, bool showLoader = true}) async {
    if(showLoader)LoadingDialog.showLoadingDialog();
    body.addAll({"branchId": _branch});
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
      var response = await _dio.post("$baseUrl$url", data: formData);
      if(showLoader)EasyLoading.dismiss();
      LoadingDialog.showToastNotification(response.data["msg"].toString());
      if (response.data["key"] == 1) return response.data;
    } on DioError catch (e) {
      if(showLoader)EasyLoading.dismiss();
      if (e.response.statusCode == 401 || e.response.statusCode == 301|| e.response.statusCode == 302) {
        logout(context);
      } else {
        LoadingDialog.showToastNotification(tr(context, "chickNet"));
      }
    }

    return null;
  }

  _getHeader() async {
    String token = GlobalState.instance.get("token");
    return {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
  }

  Future<void> logout(BuildContext context) async {
    Utils.clearSavedData();
    AutoRouter.of(context).popAndPush(LoginRoute());
  }
}
