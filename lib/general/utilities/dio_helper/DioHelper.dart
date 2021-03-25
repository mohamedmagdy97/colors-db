part of 'DioImports.dart';


class DioHelper {
  Dio _dio;
  DioCacheManager _manager;
  final bool forceRefresh;
  final baseUrl = "https://khdamatawamer.ip4s.com";
  final String _branch="6";

  DioHelper({this.forceRefresh=true}){
    if (_dio == null) {
      _dio = Dio(BaseOptions(
          baseUrl: baseUrl,
          contentType: "application/x-www-form-urlencoded; charset=utf-8"
      ),
      )
        ..interceptors.add(_getCacheManager().interceptor)
        ..interceptors.add(LogInterceptor(responseBody: true));
    }
  }

  DioCacheManager _getCacheManager() {
    if (null == _manager) {
      _manager =
          DioCacheManager(CacheConfig(baseUrl: baseUrl,defaultRequestMethod: "POST"));
    }
    return _manager;
  }


  Options _buildCacheOptions(Map<String,dynamic> body,{bool subKey=true}){
    return buildCacheOptions(
        Duration(days: 3),
        maxStale: Duration(days: 7),
        forceRefresh: forceRefresh,
        subKey: subKey? json.encode(body):""
    );
  }


  Future<dynamic> get(String url,Map<String,dynamic> body)async{
    // body.addAll({"branchId":_branch});
    _printRequestBody(body);
    _dio.options.headers=await _getHeader();

    try{
      var response = await _dio.post("$baseUrl$url",data: FormData.fromMap(body),options: _buildCacheOptions(body));
      print( "response ${response.statusCode}");
      var data= response.data;
      if(data["key"]==1){
        return data;
      }else{
        LoadingDialog.showToastNotification(data["msg"].toString());
      }
    }on DioError catch(e){
      if(e.response.statusCode==401||e.response.statusCode==301){
        tokenExpired();
      }else{
        LoadingDialog.showToastNotification("تآكد من الانترنت");
      }
    }
    return null;
  }


  Future<dynamic> post(String url,Map<String,dynamic>  body,{bool showLoader=true})async{
    if(showLoader)LoadingDialog.showLoadingDialog();
    // body.addAll({"branchId":_branch});
    _printRequestBody(body);
    _dio.options.headers=await _getHeader();

    try{
      var response = await _dio.post("$baseUrl$url",data: FormData.fromMap(body),options: _buildCacheOptions(body));
      print( "response ${response.statusCode}");
      if(showLoader)EasyLoading.dismiss();
      LoadingDialog.showToastNotification(response.data["msg"].toString());
      if(response.data["key"]==1)return response.data;

    }on DioError catch(e){
      if(showLoader)EasyLoading.dismiss();
      if(e.response.statusCode==401||e.response.statusCode==301){
        tokenExpired();
      }else{
        LoadingDialog.showToastNotification("تآكد من الانترنت");
      }
    }

    return null;

  }


  Future<dynamic> uploadFile(String url,Map<String,dynamic> body,{bool showLoader=true}) async{
    if(showLoader)LoadingDialog.showLoadingDialog();
    // body.addAll({"branchId":_branch});
    _printRequestBody(body);
    FormData formData = FormData.fromMap(body);
    body.forEach((key, value) async {
      if((value) is File){
        //create multipart using filepath, string or bytes
        MapEntry<String, MultipartFile> pic=MapEntry("$key", MultipartFile.fromFileSync(value.path, filename: value.path.split("/").last),);
        //add multipart to request
        formData.files.add(pic);

      }else if((value) is List<File>){
        List<MapEntry<String, MultipartFile>> files=[];
        value.forEach((element) async {
          MapEntry<String, MultipartFile> pic=MapEntry("$key", MultipartFile.fromFileSync(element.path, filename: element.path.split("/").last,));
          files.add(pic);
        });
        formData.files.addAll(files);

      }else{
        // requestData.addAll({"$key":"$value"});

      }
    });

    _dio.options.headers=await _getHeader();
    //create multipart request for POST or PATCH method

    try{
      var response = await _dio.post("$baseUrl$url",data: formData,options: _buildCacheOptions(body,subKey: false));
      print( "response ${response.statusCode}");
      if(showLoader)EasyLoading.dismiss();
      LoadingDialog.showToastNotification(response.data["msg"].toString());
      if(response.data["key"]==1)return response.data;

    }on DioError catch(e){
      if(showLoader)EasyLoading.dismiss();
      if(e.response.statusCode==401||e.response.statusCode==301){
        tokenExpired();
      }else{
        LoadingDialog.showToastNotification("تآكد من الانترنت");
      }
    }

    return null;
  }


  void _printRequestBody(Map<String,dynamic> body){
    print("-------------------------------------------------------------------");
    print(body);
    print("-------------------------------------------------------------------");
  }

  _getHeader()async{
    String token = GlobalState.instance.get("token");
    return {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
  }

  void tokenExpired(){
    Utils.clearSavedData();
    // ExtendedNavigator.root.push(Routes.login);
  }



}