part of 'UtilsImports.dart';

class Utils {

  static Future<void> manipulateSplashData(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    initDio(lang: "ar");
    initCustomWidgets(language: "ar");
    GlobalState.instance.set("token","");
    var strUser = prefs.get("user");
    if (strUser != null) {
      UserModel data = UserModel.fromJson(json.decode("$strUser"));
      GlobalState.instance.set("token", data.token);
      setCurrentUserData(data, context);
    } else {
      AutoRouter.of(context).replaceAll([LoginRoute()]);
    }
  }

  static initDio({required String lang}) {
    DioUtils.init(
      baseUrl: ApiNames.baseUrl,
      style: CustomInputTextStyle(lang: lang),
      primary: MyColors.primary,
      authLink: LoginRoute.name,
      language: lang,
      dismissFunc: EasyLoading.dismiss,
      showLoadingFunc: LoadingDialog.showLoadingDialog,
      branch: '1',
      authClick: () {  },
    );
  }

  static initCustomWidgets({required String language}) {
    WidgetUtils.init(
        style: CustomInputTextStyle(lang: language),
        primary: MyColors.primary,
        language: language,
        inputStyle: (
                {String? label,
                  String? hint,
                  Widget? prefixIcon,
                  Widget? suffixIcon,
                  Color? hintColor,
                  Color? fillColor,
                  BorderRadius? radius,
                  Color? focusBorderColor,
                  EdgeInsets? padding,
                  Color? enableColor}) =>
            CustomInputDecoration(
                lang: language,
                labelTxt: label,
                hint: hint,
                prefixIcon: prefixIcon,
                suffixIcon: suffixIcon,
                enableColor: enableColor,
                customFillColor: fillColor,
                padding: padding));
  }

  static Future<bool> manipulateLoginData(
      BuildContext context, dynamic data, String token) async {
    if (data != null) {
      int status = data["responseCode"];
      if (status == 1) {
        UserModel user = UserModel.fromJson(data["dateSet"]);
        user.token = data['dateSet']["token"];
        GlobalState.instance.set("token", user.token);
        await Utils.saveUserData(user);
        Utils.setCurrentUserData(user, context);
      }
      return true;
    }
    return false;
  }

  static void setCurrentUserData(UserModel model, BuildContext context) async {
    context.read<UserCubit>().onUpdateUserData(model);
    AutoRouter.of(context).replaceAll([HomeRoute()]);
  }

  static Future<void> saveUserData(UserModel model) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("user", json.encode(model.toJson()));
  }

  static UserModel getSavedUser({required BuildContext context}) {
    return context.read<UserCubit>().state.model;
  }

  static void clearSavedData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

}
