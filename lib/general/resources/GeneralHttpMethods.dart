part of 'GeneralRepoImports.dart';

class GeneralHttpMethods {
  final BuildContext context;

  GeneralHttpMethods(this.context);

  Future<ColorModel?> getColors() async {
    String data = await DefaultAssetBundle.of(context)
        .loadString("assets/json/colors.json");
    final jsonResult = jsonDecode(data);
    return ColorModel.fromJson(jsonResult);
  }
}
