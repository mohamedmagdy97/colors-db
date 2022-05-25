part of 'UtilsImports.dart';

class Utils {
  static Future<void> manipulateSplashData(BuildContext context) async {
    initCustomWidgets(language: "ar");

    AutoRouter.of(context).replaceAll([RegisterRoute()]);
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
}
