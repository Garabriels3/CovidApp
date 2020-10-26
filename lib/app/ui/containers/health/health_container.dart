import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// ignore: must_be_immutable
class HealthContainer extends StatefulWidget {
  Color color;

  HealthContainer({this.color});

  @override
  _HealthContainerState createState() => _HealthContainerState();
}

class _HealthContainerState extends State<HealthContainer> {
  GoogleMapController mapController;
  double latitude = -23.5570497;
  double longitude = -46.4922667;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GoogleMap(
        myLocationEnabled: true,
        initialCameraPosition:
            CameraPosition(target: LatLng(latitude, longitude), zoom: 13.0),
      ),
    );
  }
}
