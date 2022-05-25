part of 'GeneralRepoImports.dart';

class GeneralHttpMethods {
  final BuildContext context;

  GeneralHttpMethods(this.context);

  Future<ColorModel?> getColors() async {
    String data = await DefaultAssetBundle.of(context)
        .loadString("assets/json/colors.json");
    final jsonResult = jsonDecode(data);
    if (data != null) {
      return ColorModel.fromJson(jsonResult);
    } else {
      return null;
    }
  }
}
