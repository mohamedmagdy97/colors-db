part of 'RegisterImports.dart';

class RegisterData {
  GlobalKey<ScaffoldState> scaffold = new GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  final GlobalKey<CustomButtonState> btnKey =
      new GlobalKey<CustomButtonState>();

  final GenericBloc<String> typeBloc = GenericBloc('user');
  final GenericBloc<bool> seenBloc = GenericBloc(false);
  final TextEditingController password = new TextEditingController();
  final TextEditingController phone = new TextEditingController();
  final TextEditingController mail = new TextEditingController();
  final TextEditingController name = new TextEditingController();

  void userLogin(BuildContext context) async {
    FocusScope.of(context).requestFocus(FocusNode());
    if (formKey.currentState!.validate()) {
      RegisterModel model = RegisterModel(
        email: mail.text,
        phone: phone.text,
        userName: name.text,
        password: password.text,
        // roles: ["user"],
        roles: [typeBloc.state.data],
      );

      var res=await GeneralRepository(context).register(model);
      if(res){
        CustomToast.showSimpleToast(msg: 'User has been Registered');
        AutoRouter.of(context).popAndPush(LoginRoute());
      }
    }
  }
}
