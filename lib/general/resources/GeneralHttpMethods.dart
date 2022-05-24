part of 'GeneralRepoImports.dart';

class GeneralHttpMethods {
  final BuildContext context;


  GeneralHttpMethods(this.context);

  Future<bool> login(String email, String pass) async {
    Map<String, dynamic> body = {
      "Email": "$email",
      "Password": "$pass",
    };
    var _data = await DioHelper(context, forceRefresh: true)
        .post(ApiNames.login, body, showLoader: false);
    print("data is $_data");
    return Utils.manipulateLoginData(context, _data, "");
  }

  Future<bool> register(RegisterModel model) async {
    var _data = await DioHelper(context, forceRefresh: true)
        .post(ApiNames.register, model.toJson());
    print("data is $_data");
    return (_data != null);
  }
  Future<bool> getColors() async {
    var _data = await DioHelper(context, forceRefresh: true)
        .get('assets/json/colors.json',{});
    print("data is $_data");
    return (_data != null);
  }

  Future<HomeDetailsModel?> home(HomeModel model) async {
    var _data = await DioHelper(context, forceRefresh: true)
        .get(ApiNames.halaPayments, model.toJson());
    print("data is $_data");
    if (_data != null) {
      return HomeDetailsModel.fromJson(_data["dateSet"]);
    } else {
      return null;
    }
  }
}
