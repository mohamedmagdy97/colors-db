part of 'RegisterWidgetsImports.dart';

class BuildAutoAssignField extends StatelessWidget {
  const BuildAutoAssignField({
    Key? key,
    required this.registerData,
  }) : super(key: key);

  final RegisterData registerData;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        MyText(title: 'Auto Assigned', color: MyColors.black, size: 12),
        GenericTextField(
          fieldTypes: FieldTypes.normal,
          hint: 'Default value',
          controller: registerData.forthController,
          enableBorderColor: MyColors.primary,
          margin: const EdgeInsets.symmetric(vertical: 4),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 5, horizontal: 4),
          action: TextInputAction.next,
          type: TextInputType.phone,
          radius: const BorderRadius.all(Radius.circular(4)),
          validate: (value) => value!.validateEmpty(context),
        ),
      ],
    );
  }
}
