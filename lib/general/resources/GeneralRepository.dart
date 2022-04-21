part of 'GeneralRepoImports.dart';


class GeneralRepository {
  late BuildContext _context;
  late GeneralHttpMethods _generalHttpMethods;
  GeneralRepository(BuildContext context) {
    _context = context;
    _generalHttpMethods = new GeneralHttpMethods(_context);
  }

  // Future<bool> setUserLogin(String email, String pass)=> _generalHttpMethods.userLogin(email, pass);
  Future<bool> login(String email, String pass)=> _generalHttpMethods.login(email, pass);
  Future<bool> register(RegisterModel model)=> _generalHttpMethods.register(model);
  Future<HomeDetailsModel?> home(HomeModel model)=> _generalHttpMethods.home(model);
/*

  Future<bool> sendCode(String code, String userId) =>
      _generalHttpMethods.sendCode(code, userId);

  Future<bool> resendCode(String userId) =>
      _generalHttpMethods.resendCode(userId);

  Future<String?> aboutApp() => _generalHttpMethods.aboutApp();

  Future<String?> terms() => _generalHttpMethods.terms();

  Future<bool> switchNotify() => _generalHttpMethods.switchNotify();

  Future<bool> forgetPassword(String phone) =>
      _generalHttpMethods.forgetPassword(phone);

  Future<bool> resetUserPassword(String userId, String code, String pass) =>
      _generalHttpMethods.resetUserPassword(userId, code, pass);

  Future<List<QuestionModel>> frequentQuestions() =>
      _generalHttpMethods.frequentQuestions();

  Future<bool> sendMessage({ String? name, String? mail, String? message}) =>
      _generalHttpMethods.sendMessage(name, mail, message);
*/

}
