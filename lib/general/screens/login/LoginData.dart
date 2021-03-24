part of 'LoginImports.dart';

class LoginData{

  final GlobalKey<ScaffoldState> scaffold = new GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  final TextEditingController phone = new TextEditingController();
  final TextEditingController pass = new TextEditingController();
  final LoginCubit loginCubit =new LoginCubit();

  void setUserLogin(BuildContext context) async {
    FocusScope.of(context).requestFocus(FocusNode());
    if(formKey.currentState.validate()){
      loginCubit.onchangeLoginLoading();
      String phoneEn = Utils.convertDigitsToLatin(phone.text);
      String passEn = Utils.convertDigitsToLatin(pass.text);
      bool result= await GeneralRepository(context).setUserLogin(phoneEn, passEn);
      loginCubit.onchangeLoginLoading();
      if(result){
        context.read<AuthCubit>().onUpdateAuth(true);
        // ExtendedNavigator.of(context).push(Routes.home);
      }

    }

  }

  Future<bool> onBackPressed() async {
    SystemNavigator.pop();
    return true;
  }

  void enterAsVisitor(BuildContext context)async{
    context.read<AuthCubit>().onUpdateAuth(false);
    // ExtendedNavigator.of(context).push(Routes.home,arguments: HomeArguments(parentCount: parentCount));
  }

}