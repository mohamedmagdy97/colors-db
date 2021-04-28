part of 'ConfirmPasswordWidgetsImports.dart';

class BuildButtonList extends StatelessWidget {
  final ConfirmPasswordData confirmPasswordData;
  final String userId;

  const BuildButtonList({required this.confirmPasswordData,required this.userId});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultButton(
          title: tr(context,"confirm"),
          onTap: (){},
          // onTap: () => activeAccountData.onActiveAccount(context, userId),
          color: MyColors.primary,
          margin: const EdgeInsets.symmetric(
            vertical: 30,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyText(
              title:tr(context,"noReceiveCode"),
              size: 13,
              color: MyColors.grey,
            ),
            InkWell(
              // onTap: () =>
              // activeAccountData.onResendCode(context, userId),
              child: MyText(
                title: tr(context,"sendCode"),
                size: 13,
                color: MyColors.primary,
                decoration: TextDecoration.underline,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
