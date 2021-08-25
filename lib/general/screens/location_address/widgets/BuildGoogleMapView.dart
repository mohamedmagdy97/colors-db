part of 'LocationWidgetsImports.dart';

class BuildGoogleMapView extends StatelessWidget {
  final LocationAddressData locationAddressData;

  const BuildGoogleMapView({required this.locationAddressData});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocationCubit, LocationState>(
      builder: (context, state) {
        CameraPosition _initialLoc = CameraPosition(
          target: LatLng(state.model!.lat, state.model!.lng),
          zoom: 16.4746,
        );
        return Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              height: MediaQuery
                  .of(context)
                  .size
                  .height,
              child: GoogleMap(
                  mapType: MapType.normal,
                  // markers: _markers,
                  initialCameraPosition: _initialLoc,
                  onMapCreated: (GoogleMapController controller) {
                    locationAddressData.controller.complete(controller);
                  },
                  myLocationButtonEnabled: true,
                  myLocationEnabled: true,
                  rotateGesturesEnabled: true,
                  scrollGesturesEnabled: true,
                  trafficEnabled: true,
                  zoomControlsEnabled: true,
                  tiltGesturesEnabled: true,
                  compassEnabled: true,
                  indoorViewEnabled: true,
                  buildingsEnabled: true,
                  mapToolbarEnabled: true,
                  zoomGesturesEnabled: true,
                  onCameraIdle: () {
                    locationAddressData.getLocationAddress(context);
                  },
                  onTap: (location) {
                    locationAddressData.getLocationAddress(context);
                  },
                  onCameraMove: (loc) {
                    locationAddressData.locationModel = LocationModel(
                        lat: loc.target.latitude,
                        lng: loc.target.longitude,
                        address: "",
                    );
                  }
              ),
            ),
            ImageIcon(
              AssetImage(Res.marker),
              size: 50,
              color: MyColors.secondary,
            ),
          ],
        );
      },
    );
  }
}
