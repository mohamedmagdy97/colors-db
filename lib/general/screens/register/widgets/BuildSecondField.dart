part of 'RegisterWidgetsImports.dart';

class BuildSecondField extends StatelessWidget {
  const BuildSecondField({
    Key? key,
    required this.registerData,
  }) : super(key: key);

  final RegisterData registerData;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericBloc, GenericState>(
      bloc: registerData.startWithACubit,
      builder: (context, state) {
        return Offstage(
          offstage: state.data,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              MyText(title: 'Color check', color: MyColors.black, size: 12),
              GenericTextField(
                fieldTypes: FieldTypes.normal,
                hint: 'color',
                controller: registerData.secondController,
                enableBorderColor: MyColors.primary,
                margin: const EdgeInsets.symmetric(vertical: 4),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 4),
                action: TextInputAction.next,
                type: TextInputType.emailAddress,
                radius: const BorderRadius.all(Radius.circular(4)),
                validate: (value) => value!.validateEmpty(context),
              ),
            ],
          ),
        );
      },
    );
  }
}
