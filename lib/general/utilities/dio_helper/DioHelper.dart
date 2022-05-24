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

  Future<dynamic> get(String url, Map<String, dynamic> body) async {
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
        // tokenExpired();
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
    if (showLoader) LoadingDialog.showLoadingDialog();
    _printRequestBody(body);
    _dio.options.headers = await _getHeader();

    try {
      var response = await _dio.post("$_baseUrl$url", data: body);
      print("response ${response.statusCode}");
      if (showLoader) EasyLoading.dismiss();
      if (response.data["responseCode"] == 2) {
        return CustomToast.showSimpleToast(
            msg: response.data["dateSet"].toString());
      }
      var data = response.data;
      return data;
    } on DioError catch (e) {
      if (showLoader) EasyLoading.dismiss();
      if (e.response?.statusCode == 200 &&
          e.response?.data["responseCode"] == 2) {
        CustomToast.showSimpleToast(msg: e.response?.data["dateSet"]);
      }
      if (e.response?.statusCode == 422 ||
          e.response?.statusCode == 403 ||
          e.response?.statusCode == 400) {
        if (e.response?.data["dateSet"] != null) {
          CustomToast.showSimpleToast(msg: e.response?.data["dateSet"]);
        } else if (e.response?.data["error"] != null) {
          CustomToast.showToastNotification(
              tr(context, e.response?.data["error"]));
        } else {
          CustomToast.showToastNotification(
              e.response?.data["responseMessage"].toString());
        }
      } else if (e.response?.statusCode == 401 ||
          e.response?.statusCode == 301) {
        // tokenExpired();
      } else if (e.response?.statusCode == 403) {
        CustomToast.showSimpleToast(msg: e.response?.data["responseMessage"]);
      } else {
        CustomToast.showSimpleToast(msg: tr(context, "chickNet"));
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
      "Authorization": "Bearer $token",
      "Locale": pref.get("lang") ?? "ar"
    };
  }

  // void tokenExpired() {
  //   Future.delayed(Duration(seconds: 1), (() {
  //     Utils.clearSavedData();
  //     AutoRouter.of(context).pushAndPopUntil(
  //      RegisterRoute(),
  //       predicate: (Route<dynamic> route) => false,
  //     );
  //   }));
  // }
}
