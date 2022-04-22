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
          MyText(title: 'اسم المستخدم', color: MyColors.black, size: 12),
          GenericTextField(
            fieldTypes: FieldTypes.normal,
            hint: tr(context, "name"),
            controller: registerData.name,
            fillColor: MyColors.white,
            enableBorderColor: MyColors.primary,
            margin: const EdgeInsets.symmetric(vertical: 4),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 5, horizontal: 4),
            action: TextInputAction.next,
            type: TextInputType.text,
            radius: const BorderRadius.all(Radius.circular(4)),
            validate: (value) => value!.validateEmpty(context),
          ),
          const SizedBox(height: 16),
          MyText(title: 'البريد الالكتروني', color: MyColors.black, size: 12),
          GenericTextField(
            fieldTypes: FieldTypes.normal,
            hint: tr(context, "mail"),
            controller: registerData.mail,
            fillColor: MyColors.white,
            enableBorderColor: MyColors.primary,
            margin: const EdgeInsets.symmetric(vertical: 4),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 5, horizontal: 4),
            action: TextInputAction.next,
            type: TextInputType.emailAddress,
            radius: const BorderRadius.all(Radius.circular(4)),
            validate: (value) => value!.validateEmpty(context),
          ),
          const SizedBox(height: 16),
          MyText(title: 'رقم الهاتف', color: MyColors.black, size: 12),
          GenericTextField(
            fieldTypes: FieldTypes.normal,
            hint: tr(context, "phone"),
            controller: registerData.phone,
            fillColor: MyColors.white,
            enableBorderColor: MyColors.primary,
            margin: const EdgeInsets.symmetric(vertical: 4),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 5, horizontal: 4),
            action: TextInputAction.next,
            type: TextInputType.phone,
            radius: const BorderRadius.all(Radius.circular(4)),
            validate: (value) => value!.validateEmpty(context),
          ),
          const SizedBox(height: 16),
          BlocBuilder<GenericBloc, GenericState>(
            bloc: registerData.typeBloc,
            builder: (context, state) {
              return Column(
                children: [
                  RadioListTile(
                      title: MyText(
                          title: 'عميل', color: MyColors.black, size: 14),
                      value: 'user',
                      groupValue: state.data,
                      onChanged: (v) =>
                          registerData.typeBloc.onUpdateData(v.toString())),
                  RadioListTile(
                      title: MyText(
                          title: 'مقدم خدمه', color: MyColors.black, size: 14),
                      value: 'delegate',
                      groupValue: state.data,
                      onChanged: (v) =>
                          registerData.typeBloc.onUpdateData(v.toString())),
                ],
              );
            },
          ),
          const SizedBox(height: 16),
          MyText(title: 'كلمة المرور', color: MyColors.black, size: 12),
          BlocBuilder<GenericBloc, GenericState>(
            bloc: registerData.seenBloc,
            builder: (context, state) {
              return GenericTextField(
                fieldTypes:
                    state.data ? FieldTypes.normal : FieldTypes.password,
                hint: tr(context, "password"),
                fillColor: MyColors.white,
                enableBorderColor: MyColors.primary,
                controller: registerData.password,
                radius: const BorderRadius.all(Radius.circular(4)),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 4),
                validate: (value) => value!.validateEmpty(context),
                type: TextInputType.text,
                margin: const EdgeInsets.symmetric(vertical: 4),
                suffixIcon: IconButton(
                    onPressed: () =>
                        registerData.seenBloc.onUpdateData(!state.data),
                    icon: Icon(state.data
                        ? Icons.visibility_off
                        : Icons.remove_red_eye)),
                action: TextInputAction.done,
                onSubmit: () => registerData.userLogin(context),
              );
            },
          ),
        ],
      ),
    );
  }
}
