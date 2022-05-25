part of 'GeneralRepoImports.dart';


class GeneralRepository {
  late BuildContext _context;
  late GeneralHttpMethods _generalHttpMethods;
  GeneralRepository(BuildContext context) {
    _context = context;
    _generalHttpMethods = new GeneralHttpMethods(_context);
  }

  Future<ColorModel?> getColors()=> _generalHttpMethods.getColors();


}
