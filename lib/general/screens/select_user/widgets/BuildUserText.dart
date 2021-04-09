part of 'SelectUserWidgetsImports.dart';

class BuildUserText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText(
            title: tr(context,"register"),
            size: 19,
            color: MyColors.primary,
          ),
          MyText(
            title:tr(context,"selectAccount"),
            size: 14,
            color: MyColors.black.withOpacity(.6),
          ),
        ],
      ),
    );
  }
}
