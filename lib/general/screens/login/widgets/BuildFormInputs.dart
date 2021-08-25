part of 'LoginWidgetsImports.dart';

class BuildFormInputs extends StatelessWidget {
  final LoginData loginData;

  const BuildFormInputs({required this.loginData});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: loginData.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GenericTextField(
            fieldTypes: FieldTypes.normal,
            label: tr(context, "phone"),
            controller: loginData.phone,
            margin: const EdgeInsets.symmetric(vertical: 10),
            action: TextInputAction.next,
            type: TextInputType.phone,
            validate: (value) => value!.validateEmpty(context),
          ),
          GenericTextField(
            fieldTypes: FieldTypes.password,
            label: tr(context, "password"),
            controller: loginData.password,
            validate: (value) => value!.validateEmpty(context),
            type: TextInputType.text,
            action: TextInputAction.done,
            onSubmit: () => loginData.userLogin(context),
          ),
          BlocConsumer<LocationCubit, LocationState>(
            bloc: loginData.locationCubit,
            listener: (context, state) {
              loginData.address.text=state.model?.address??"";
            },
            builder: (context, state) {
              return GenericTextField(
                fieldTypes: FieldTypes.clickable,
                label: "location",
                controller: loginData.address,
                validate: (value) => value!.validateEmpty(context),
                type: TextInputType.text,
                action: TextInputAction.done,
                onTab: () => loginData.onLocationClick(context),
                // onSubmit: () => loginData.userLogin(context),
              );
            },
          ),
        ],
      ),
    );
  }
}
