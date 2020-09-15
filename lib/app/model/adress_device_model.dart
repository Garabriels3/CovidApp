import 'package:geocoding/geocoding.dart';

class AdressDeviceModel {
  String name;
  String street;
  String isoCountryCode;
  String country;
  String postalCode;
  String administrativeArea;
  String subAdministrativeArea;
  String locality;
  String subLocality;
  String thoroughfare;
  String subThoroughfare;

  AdressDeviceModel(
      {this.name,
      this.street,
      this.isoCountryCode,
      this.country,
      this.postalCode,
      this.administrativeArea,
      this.subAdministrativeArea,
      this.locality,
      this.subLocality,
      this.thoroughfare,
      this.subThoroughfare});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['street'] = this.street;
    data['isoCountryCode'] = this.isoCountryCode;
    data['country'] = this.country;
    data['postalCode'] = this.postalCode;
    data['administrativeArea'] = this.administrativeArea;
    data['subAdministrativeArea'] = this.subAdministrativeArea;
    data['locality'] = this.locality;
    data['subLocality'] = this.subLocality;
    data['thoroughfare'] = this.thoroughfare;
    data['subThoroughfare'] = this.subThoroughfare;
    return data;
  }

  AdressDeviceModel.fromPlacemark(Placemark place) {
    name = place.name;
    street = place.street;
    isoCountryCode = place.isoCountryCode;
    country = place.country;
    postalCode = place.postalCode;
    administrativeArea = place.administrativeArea;
    subAdministrativeArea = place.subAdministrativeArea;
    locality = place.locality;
    subLocality = place.subLocality;
    thoroughfare = place.thoroughfare;
    subThoroughfare = place.subThoroughfare;
  }
}
