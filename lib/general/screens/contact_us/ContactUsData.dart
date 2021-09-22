part of 'ContactUsImports.dart';

class ContactUsData{

  final LocationCubit locationCubit =new LocationCubit();
  final TextEditingController address = new TextEditingController();

  onLocationClick(BuildContext context)async{
    var _loc = await Utils.getCurrentLocation(context);
    locationCubit.onLocationUpdated(LocationModel(
      lat: _loc?.latitude ?? 24.774265,
      lng: _loc?.longitude ?? 46.738586,
      address: "",
    ));
    Navigator.of(context).push(CupertinoPageRoute(builder: (cxt)=> BlocProvider.value(
      value: locationCubit,
      child: LocationAddress(),
    )));
  }

}