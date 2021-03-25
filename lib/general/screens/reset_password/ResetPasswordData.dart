part of 'ResetPasswordImports.dart';

class ResetPasswordData{

  GlobalKey<ScaffoldState> _scaffold = new GlobalKey<ScaffoldState>();
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  final ResetPasswordCubit resetPasswordCubit =new ResetPasswordCubit();
  TextEditingController _code = new TextEditingController();
  TextEditingController _new = new TextEditingController();
  TextEditingController _conform = new TextEditingController();

  void setForgetPassword(BuildContext context,String userId) async {
    FocusScope.of(context).requestFocus(FocusNode());
    if(_formKey.currentState.validate()){
      resetPasswordCubit.onUpdateLoadingState(true);
      // bool result= await GeneralRepository(context).resetUserPassword(userId, _code.text, _new.text);
      resetPasswordCubit.onUpdateLoadingState(false);
      // if(result){
      //   // ExtendedNavigator.of(context).popUntilPath(Routes.login);
      // }
    }

  }


}