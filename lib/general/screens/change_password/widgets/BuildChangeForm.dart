part of 'ChangePassWidgetsImports.dart';

class BuildChangeForm extends StatelessWidget {
  final ChangePasswordData changePasswordData;

  const BuildChangeForm({required this.changePasswordData});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: changePasswordData.formKey,
      child: Column(
        children: [
          LabelTextField(
            label: 'كلمة المرور القديمة',
            controller: changePasswordData.oldPassword,
            margin: const EdgeInsets.symmetric(vertical: 5),
            type: TextInputType.name,
            validate: (value) => value!.validateEmpty(context),
            isPassword: true,
            action: TextInputAction.next,
          ),
          LabelTextField(
            label: 'كلمة المرور الجديدة',
            controller: changePasswordData.newPassword,
            margin: const EdgeInsets.symmetric(vertical: 5),
            type: TextInputType.name,
            validate: (value) => value!.validatePassword(context),
            isPassword: true,
            action: TextInputAction.next,
          ),
          LabelTextField(
            label: 'تأكيد كلمة المرور الجديدة',
            controller: changePasswordData.confirmNewPassword,
            margin: const EdgeInsets.symmetric(vertical: 5),
            type: TextInputType.name,
            validate: (value) => value!.validatePasswordConfirm(context,
                pass: changePasswordData.newPassword.text),
            isPassword: true,
            action: TextInputAction.done,
            onSubmit: ()=> changePasswordData.setChangePassword(context),
          ),
        ],
      ),
    );
  }
}
