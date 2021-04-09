part of 'SelectLangWidgetsImports.dart';

class BuildLangText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 40,
        top: 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText(
            title: tr(context,"lang"),
            size: 20,
            color: MyColors.primary,
          ),
          MyText(
            title:tr(context,"selectLang"),
            size: 14,
            color: MyColors.black,
          ),
        ],
      ),
    );
  }
}
