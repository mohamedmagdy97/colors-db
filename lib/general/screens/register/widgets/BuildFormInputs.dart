part of 'RegisterWidgetsImports.dart';

class BuildFormInputs extends StatelessWidget {
  final RegisterData registerData;

  const BuildFormInputs({required this.registerData});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: registerData.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BuildFirstField(registerData: registerData),
          BuildSecondField(registerData: registerData),
          BuildSuggestionField(registerData: registerData),
          BuildAutoAssignField(registerData: registerData)
        ],
      ),
    );
  }
}
