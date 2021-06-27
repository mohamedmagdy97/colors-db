part of 'GeneralRepoImports.dart';


class GeneralRepository {
  late BuildContext _context;
  late GeneralHttpMethods _generalHttpMethods;
  GeneralRepository(BuildContext context) {
    _context = context;
    _generalHttpMethods = new GeneralHttpMethods(_context);
  }

  Future<bool> setUserLogin(String phone, String pass)=> _generalHttpMethods.userLogin(phone, pass);

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

}
