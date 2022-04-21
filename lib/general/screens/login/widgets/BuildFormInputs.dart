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
          MyText(title: 'البريد الالكتروني', color: MyColors.black, size: 12),
          GenericTextField(
            fieldTypes: FieldTypes.normal,
            hint: tr(context, "mail"),
            controller: loginData.email,
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
          MyText(title: 'كلمة المرور', color: MyColors.black, size: 12),
          BlocBuilder<GenericBloc, GenericState>(
            bloc: loginData.seenBloc,
            builder: (context, state) {
              return GenericTextField(
                fieldTypes:
                state.data ? FieldTypes.normal : FieldTypes.password,
                hint: tr(context, "password"),
                fillColor: MyColors.white,
                enableBorderColor: MyColors.primary,
                controller: loginData.password,
                radius: const BorderRadius.all(Radius.circular(4)),
                contentPadding:
                const EdgeInsets.symmetric(vertical: 5, horizontal: 4),
                validate: (value) => value!.validateEmpty(context),
                type: TextInputType.text,
                margin: const EdgeInsets.symmetric(vertical: 4),
                suffixIcon: IconButton(
                    onPressed: () {
                      loginData.seenBloc.onUpdateData(!state.data);
                    },
                    icon: Icon(state.data ? Icons.visibility_off : Icons
                        .remove_red_eye)),
                action: TextInputAction.done,
                onSubmit: () => loginData.userLogin(context),
              );
            },
          ),
        ],
      ),
    );
  }
}
