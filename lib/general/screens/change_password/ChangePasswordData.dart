part of 'ChangePasswordImports.dart';

class ChangePasswordData {
  final GlobalKey<ScaffoldState> scaffold = new GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  final GlobalKey<CustomButtonState> btnKey = new GlobalKey();

  final TextEditingController oldPassword = new TextEditingController();
  final TextEditingController newPassword = new TextEditingController();
  final TextEditingController confirmNewPassword = new TextEditingController();

  void setChangePassword(BuildContext context)async{
    if(formKey.currentState!.validate()){
      // btnKey.currentState.animateForward();
      // var result = await CustomerRepository(context).changePassword(newPass: newPassword.text,oldPass: oldPassword.text);
      // btnKey.currentState.animateReverse();
      // if(result){
      //   ExtendedNavigator.of(context).pop();
      // }
    }
  }

}
