part of 'LoginWidgetsImports.dart';

class BuildFormInputs extends StatelessWidget {
  final LoginData loginData;

  const BuildFormInputs({this.loginData});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: loginData.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LabelTextField(
            label: tr(context,"mail"),
            controller: loginData.email,
            margin: const EdgeInsets.symmetric(vertical: 10),
            action: TextInputAction.next,
            type: TextInputType.emailAddress,
            validate: (value) => value.validateEmpty(context),
          ),
          LabelTextField(
            label: tr(context,"password"),
            controller: loginData.password,
            validate: (value) => value.validateEmpty(context),
            isPassword: true,
            action: TextInputAction.done,
            onSubmit: () => loginData.userLogin(context),
          ),
        ],
      ),
    );
  }
}
