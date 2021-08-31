part of 'ContactUsImports.dart';

class ContactUs extends StatefulWidget {
  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {

  final ContactUsData contactUsData =new ContactUsData();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        BlocConsumer<LocationCubit, LocationState>(
          bloc: contactUsData.locationCubit,
          listener: (context, state) {
            contactUsData.address.text=state.model?.address??"";
          },
          builder: (context, state) {
            return GenericTextField(
              fieldTypes: FieldTypes.clickable,
              label: "location",
              controller: contactUsData.address,
              validate: (value) => value!.validateEmpty(context),
              type: TextInputType.text,
              action: TextInputAction.done,
              onTab: () => contactUsData.onLocationClick(context),
              // onSubmit: () => loginData.userLogin(context),
            );
          },
        ),

      ],
    );
  }
}
