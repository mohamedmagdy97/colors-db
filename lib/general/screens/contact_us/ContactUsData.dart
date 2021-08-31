part of 'ContactUsImports.dart';

class ContactUsData{

  final LocationCubit locationCubit =new LocationCubit();
  final TextEditingController address = new TextEditingController();

  onLocationClick(BuildContext context){
    Navigator.of(context).push(CupertinoPageRoute(builder: (cxt)=> BlocProvider.value(
      value: locationCubit,
      child: LocationAddress(),
    )));
  }

}