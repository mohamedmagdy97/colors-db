part of 'LoginWidgetsImports.dart';

class BuildLoginButton extends StatelessWidget {
  final LoginData loginData;

  const BuildLoginButton({required this.loginData});

  @override
  Widget build(BuildContext context) {
    return LoadingButton(
      btnKey: loginData.btnKey,
      title: tr(context,"continue"),
      onTap: () => loginData.userLogin(context),
      color: MyColors.primary,
      textColor: MyColors.white,
      margin: const EdgeInsets.symmetric(vertical: 10),
    );
  }
}
