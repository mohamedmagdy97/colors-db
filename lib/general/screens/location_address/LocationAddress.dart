part of 'LocationAddressImports.dart';


class LocationAddress extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LocationAddress();
}

class _LocationAddress extends State<LocationAddress> {
  final LocationAddressData locationAddressData = new LocationAddressData();

  @override
  void initState() {
    var loc = context.read<LocationCubit>().state.model;
    double lat = loc?.lat??	24.774265;
    double lng = loc?.lng??	46.738586;
    locationAddressData.locationModel=LocationModel(lat: lat, lng: lng);
    locationAddressData.getLocationAddress(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: locationAddressData._scaffold,
      appBar: AppBar(
        title: BlocBuilder<LocationCubit,LocationState>(
          builder: (context,state){
            return MyText(
              title: "${state.model!.address}",
              size: 12,
              color: MyColors.black,
            );
          },
        ),
        backgroundColor: MyColors.primary,
        automaticallyImplyLeading: false,
        centerTitle: true,
        flexibleSpace: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5),
        ),
      ),
      body: BuildGoogleMapView(
        locationAddressData: locationAddressData,
      ),
      floatingActionButton: BuildSaveButton(
        locationAddressData: locationAddressData,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
