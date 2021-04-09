part of 'MainDataImports.dart';


class MainData {

  static String chatUrl="https://harajawamer.ip4s.com/chatHub";

  static ThemeData defaultThem=ThemeData(
    primarySwatch: Colors.grey,
    focusColor: MyColors.primary,
    accentColor: MyColors.primary,
    primaryColor: MyColors.primary,
    platform: TargetPlatform.android,
    fontFamily: GoogleFonts.cairo().fontFamily,
    textTheme: TextTheme(
      subtitle1:GoogleFonts.cairo(fontSize: 14,),
    ),
    pageTransitionsTheme: PageTransitionsTheme(builders: {
      TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    }),
  );

  static List<BlocProvider>  providers(BuildContext context)=>[
    BlocProvider<AuthCubit>(
      create: (BuildContext context)=> AuthCubit(),
    ),
  ];


}