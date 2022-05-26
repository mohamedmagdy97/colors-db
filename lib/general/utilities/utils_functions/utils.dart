part of 'UtilsImports.dart';

class Utils {
  static Future<void> manipulateSplashData(BuildContext context) async {
    initCustomWidgets();

    AutoRouter.of(context).replaceAll([RegisterRoute()]);
  }

  static initCustomWidgets() {
    WidgetUtils.init(
        style: CustomInputTextStyle(),
        primary: MyColors.primary,
        language: 'en',
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
                labelTxt: label,
                hint: hint,
                prefixIcon: prefixIcon,
                suffixIcon: suffixIcon,
                enableColor: enableColor,
                customFillColor: fillColor,
                padding: padding));
  }
}
