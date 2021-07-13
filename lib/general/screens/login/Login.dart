part of 'LoginImports.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  LoginData loginData = new LoginData();

  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      child: GestureDetector(
        onTap: ()=> FocusScope.of(context).requestFocus(FocusNode()),
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          physics: BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          children: [
            HeaderLogo(),
            BuildText(),
            BuildFormInputs(loginData: loginData),
            BuildForgetText(),
            BuildLoginButton(loginData: loginData),
            BuildNewRegister(),
            BuildRegisterButton(),
          ],
        ),
      ),
    );
  }
}
