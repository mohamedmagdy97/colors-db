part of 'MainDataImports.dart';

class MainData {
  static ThemeData defaultThem = ThemeData(
    primarySwatch: Colors.grey,
    focusColor: MyColors.primary,
    accentColor: MyColors.primary,
    primaryColor: MyColors.primary,
    fontFamily: GoogleFonts.cairo().fontFamily,
    textTheme: TextTheme(
      subtitle1: GoogleFonts.cairo(
        fontSize: 14,
      ),
    ),
  );
}
