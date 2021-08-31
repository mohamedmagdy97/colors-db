part of 'GeneralRepoImports.dart';

class GeneralHttpMethods {
  final BuildContext context;

  FirebaseMessaging messaging = FirebaseMessaging.instance;

  GeneralHttpMethods(this.context);

  Future<bool> userLogin(String phone, String pass) async {
    String? _token = await messaging.getToken();
    Map<String, dynamic> body = {
      "phone": "$phone",
      "password": "$pass",
      "deviceId": "$_token",
      "deviceType": Platform.isIOS ? "ios" : "android",
    };

    var data = await GenericHttp<dynamic>(context).callApi(
      name: ApiNames.login,
      json: body,
      returnType: ReturnType.List,
      methodType: MethodType.Post,
      returnDataFun: (data)=>data["userData"],
      toJsonFunc: (json)=>UserModel.fromJson(json),
      showLoader: false,

    );

    return Utils.manipulateLoginData(context, data, _token ?? "");
  }


  Future<List<QuestionModel>> frequentQuestions() async {
    return await GenericHttp<QuestionModel>(context).callApi(
        name: ApiNames.repeatedQuestions,
        returnType: ReturnType.List,
        showLoader: false,
        methodType: MethodType.Get,
        returnDataFun: (data)=> data["data"],
        toJsonFunc: (json)=> QuestionModel.fromJson(json)
    ) as List<QuestionModel>;
  }

  Future<bool> sendCode(String code, String userId) async {
    Map<String, dynamic> body = {"code": code, "userId": userId};
    dynamic data = await GenericHttp<dynamic>(context).callApi(
        name: ApiNames.sendCode,
        json: body,
        returnType: ReturnType.Type,
        showLoader: false,
        methodType: MethodType.Post,
    );
    return (data != null);
  }

  Future<bool> resendCode(String userId) async {
    Map<String, dynamic> body = {"userId": userId};
    dynamic data = await GenericHttp<dynamic>(context).callApi(
      name: ApiNames.resendCode,
      json: body,
      returnType: ReturnType.Type,
      showLoader: false,
      methodType: MethodType.Post,
    );
    return (data != null);
  }

  Future<String?> aboutApp() async {
    return await GenericHttp<String>(context).callApi(
      name: ApiNames.aboutApp,
      returnType: ReturnType.Type,
      showLoader: false,
      methodType: MethodType.Get,
    );
  }

  Future<String?> terms() async {
    return await GenericHttp<String>(context).callApi(
      name: ApiNames.terms,
      returnType: ReturnType.Type,
      showLoader: false,
      methodType: MethodType.Get,
    );
  }


  Future<bool> switchNotify() async {
    dynamic data = await GenericHttp<dynamic>(context).callApi(
      name: ApiNames.switchNotify,
      returnType: ReturnType.Type,
      showLoader: false,
      methodType: MethodType.Post,
    );
    return (data != null);
  }

  Future<bool> forgetPassword(String phone) async {
    Map<String, dynamic> body = {
      "phone": "$phone",
    };
    dynamic data = await GenericHttp<dynamic>(context).callApi(
      name: ApiNames.forgetPassword,
      returnType: ReturnType.Type,
      json: body,
      showLoader: false,
      methodType: MethodType.Post,
    );
    return (data != null);
  }

  Future<bool> resetUserPassword(String userId, String code, String pass) async {
    Map<String, dynamic> body = {
      "userId": "$userId",
      "code": "$code",
      "newPassword": "$pass",
    };
    dynamic data = await GenericHttp<dynamic>(context).callApi(
      name: ApiNames.resetPassword,
      returnType: ReturnType.Type,
      json: body,
      showLoader: false,
      methodType: MethodType.Post,
    );
    return (data != null);
  }

  Future<bool> sendMessage(String? name, String? mail, String? message) async {
    Map<String, dynamic> body = {
      "name": "$name",
      "email": "$mail",
      "comment": "$message",
    };
    dynamic data = await GenericHttp<dynamic>(context).callApi(
      name: ApiNames.contactUs,
      returnType: ReturnType.Type,
      json: body,
      showLoader: false,
      methodType: MethodType.Post,
    );
    return (data != null);
  }

}
