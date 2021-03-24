part of 'ForgetPasswordImports.dart';


class ForgetPasswordData{

  final GlobalKey<ScaffoldState> scaffold = new GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  final TextEditingController phone= new TextEditingController();
  final ForgetPasswordCubit forgetPasswordCubit =new ForgetPasswordCubit();


  void setForgetPassword(BuildContext context) async {
    FocusScope.of(context).requestFocus(FocusNode());
    if(formKey.currentState.validate()){
      forgetPasswordCubit.onUpdateLoading(true); 
      await GeneralRepository(context).forgetPassword(phone.text);
      forgetPasswordCubit.onUpdateLoading(false);
    }

  }

}