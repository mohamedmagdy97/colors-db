part of 'SelectLangWidgetsImports.dart';


class BuildButtonList extends StatelessWidget {
  final SelectLangData selectLangData;

  const BuildButtonList({required this.selectLangData});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultButton(
          title: tr(context,"langAr"),
          onTap: ()=> selectLangData.setUserLang(context, "ar"),
          margin: const EdgeInsets.symmetric(vertical: 15),
          color: MyColors.primary,
          textColor: MyColors.white,
        ),
        DefaultButton(
          title: tr(context,"langEn"),
          onTap: ()=> selectLangData.setUserLang(context, "en"),
          margin: const EdgeInsets.symmetric(horizontal: 0),
          color: MyColors.white,
          borderColor: MyColors.primary,
          textColor: MyColors.primary,
        ),
      ],
    );
  }
}
