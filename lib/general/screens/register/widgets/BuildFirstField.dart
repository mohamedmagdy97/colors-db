part of 'RegisterWidgetsImports.dart';

class BuildFirstField extends StatelessWidget {
  const BuildFirstField({
    Key? key,
    required this.registerData,
  }) : super(key: key);

  final RegisterData registerData;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyText(title: 'Name', color: MyColors.black, size: 12),
        GenericTextField(
          fieldTypes: FieldTypes.normal,
          hint: 'From 5 to 9 char',
          controller: registerData.firstController,
          enableBorderColor: MyColors.primary,
          margin: const EdgeInsets.symmetric(vertical: 4),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 5, horizontal: 4),
          onChange: (text) => registerData.validateFirst(text),
          action: TextInputAction.next,
          type: TextInputType.text,
          radius: const BorderRadius.all(Radius.circular(4)),
          validate: (value) => value!.firstValidate(context),
        ),
      ],
    );
  }
}
