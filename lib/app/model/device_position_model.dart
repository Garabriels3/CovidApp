import 'package:geolocator/geolocator.dart';

class DevicePositionModel {
  double longitude;
  double latitude;
  double altitude;

  DevicePositionModel({this.longitude, this.latitude, this.altitude});

  DevicePositionModel.fromJson(Map<String, dynamic> json) {
    longitude = json['longitude'];
    latitude = json['latitude'];
    altitude = json['altitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['longitude'] = this.longitude;
    data['latitude'] = this.latitude;
    data['altitude'] = this.altitude;
    return data;
  }

  DevicePositionModel.fromPosition(Position position) {
    longitude = position.longitude;
    latitude = position.latitude;
    altitude = position.altitude;
  }
}
