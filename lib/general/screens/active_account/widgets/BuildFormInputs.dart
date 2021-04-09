part of 'ActiveAccountWidgetsImports.dart';

class BuildFormInputs extends StatelessWidget {
  final ActiveAccountData activeAccountData;

  const BuildFormInputs({this.activeAccountData});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: activeAccountData.formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
        child: PinCodeTextField(
          length: 4,
          appContext: context,
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
          controller: activeAccountData.code,
        ),
      ),
    );
  }
}
