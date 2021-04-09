part of 'LoginWidgetsImports.dart';

class BuildForgetText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: InkWell(
        onTap: () =>AutoRouter.of(context).push(ForgetPasswordRoute()),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            MyText(
              title: tr(context,"forgetPassword"),
              size: 10,
              decoration: TextDecoration.underline,
              color: MyColors.primary,
            ),
          ],
        ),
      ),
    );
  }
}
