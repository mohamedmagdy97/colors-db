part of 'ConfirmPasswordWidgetsImports.dart';

class BuildFormInputs extends StatelessWidget {
  final ConfirmPasswordData confirmPasswordData;

  const BuildFormInputs({required this.confirmPasswordData});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: confirmPasswordData.formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal:25, vertical: 10),
        child: PinCodeTextField(
          length: 4,
          onChanged: (String value) {},
          backgroundColor: Colors.transparent,
          animationType: AnimationType.fade,
          pinTheme: PinTheme(
              shape: PinCodeFieldShape.underline,
              // borderRadius: BorderRadius.circular(5),
              fieldHeight: 50,
              fieldWidth: 40,
              inactiveColor: MyColors.black,
              activeColor: MyColors.black,
              selectedFillColor: MyColors.white,
              inactiveFillColor: MyColors.white,
              activeFillColor: MyColors.white,
              disabledColor: MyColors.black),
          animationDuration: Duration(milliseconds: 300),
          enableActiveFill: true,
          controller: confirmPasswordData.code,
          appContext: context,
        ),
      ),
    );
  }
}
