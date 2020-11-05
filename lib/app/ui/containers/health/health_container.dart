import 'package:covid_app/core/constants/dimens.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'health_container_viewmodel.dart';

// ignore: must_be_immutable
class HealthContainer extends StatefulWidget {
  Color color;

  HealthContainer({this.color});

  @override
  _HealthContainerState createState() => _HealthContainerState();
}

class _HealthContainerState extends State<HealthContainer> {
  var vm = HealthContainerViewModel();
  GoogleMapController mapController;
  double latitude;
  double longitude;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: vm.getData(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return Container(
              color: Color.fromRGBO(50, 92, 127, 0.9),
              child: Container(
                alignment: Alignment.center,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  strokeWidth: 5,
                ),
              ),
            );
          default:
            if (snapshot.data != null) {
              longitude = snapshot.data.longitude;
              latitude = snapshot.data.latitude;
              return Container(
                child: GoogleMap(
                  myLocationEnabled: true,
                  initialCameraPosition: CameraPosition(
                      target: LatLng(latitude, longitude), zoom: sixteen),
                ),
              );
            } else {
              latitude = -23.5610172;
              longitude = -46.6440002;
              return Container(
                child: GoogleMap(
                  myLocationEnabled: true,
                  initialCameraPosition: CameraPosition(
                      target: LatLng(latitude, longitude), zoom: sixteen),
                ),
              );
            }
        }
      },
    ); //return Container(color: Colors.blue);
  }
}
