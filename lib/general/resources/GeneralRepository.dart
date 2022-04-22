part of 'GeneralRepoImports.dart';


class GeneralRepository {
  late BuildContext _context;
  late GeneralHttpMethods _generalHttpMethods;
  GeneralRepository(BuildContext context) {
    _context = context;
    _generalHttpMethods = new GeneralHttpMethods(_context);
  }

  Future<bool> login(String email, String pass)=> _generalHttpMethods.login(email, pass);
  Future<bool> register(RegisterModel model)=> _generalHttpMethods.register(model);
  Future<HomeDetailsModel?> home(HomeModel model)=> _generalHttpMethods.home(model);


}
