part of 'LoginWidgetsImports.dart';

class BuildNewRegister extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: Divider(color: MyColors.grey.withOpacity(.5),thickness: 1.5)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: MyText(
              title:tr(context,"don'tHaveAccount"),
              size: 12,
              alien: TextAlign.center,
              color: MyColors.grey,
            ),
          ),
          Expanded(child: Divider(color: MyColors.grey.withOpacity(.5),thickness: 1.5)),
        ],
      ),
    );
  }
}
