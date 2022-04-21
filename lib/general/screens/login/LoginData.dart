part of 'LoginImports.dart';

class LoginData {
  GlobalKey<ScaffoldState> scaffold = new GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  final GlobalKey<CustomButtonState> btnKey = new GlobalKey<CustomButtonState>();

  final GenericBloc<bool> seenBloc = GenericBloc(false);
  final TextEditingController password = new TextEditingController();
  final TextEditingController email = new TextEditingController();


  void userLogin(BuildContext context) async {
    FocusScope.of(context).requestFocus(FocusNode());
    if (formKey.currentState!.validate()) {
      btnKey.currentState!.animateForward();
      // String phoneEn = Utils.convertDigitsToLatin(email.text);
      // String passEn = Utils.convertDigitsToLatin(password.text);
      var data = await GeneralRepository(context).login(email.text, password.text);
      if(data){
        btnKey.currentState!.animateReverse();

      }
      btnKey.currentState!.animateReverse();
    }
  }
}
