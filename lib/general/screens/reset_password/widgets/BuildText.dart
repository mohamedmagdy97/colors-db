part of 'ResetPasswordWidgetsImports.dart';

class BuildText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText(
            title: tr(context,"resetPassword"),
            size: 18,
            color: MyColors.primary,
          ),
          MyText(
            title: tr(context,"insertNewPss"),
            size: 13,
            color: MyColors.black.withOpacity(.6),
          ),
        ],
      ),
    );
  }
}
