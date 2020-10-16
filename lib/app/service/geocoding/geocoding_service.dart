import 'package:covid_app/app/model/device_adress_model.dart';
import 'package:covid_app/app/model/device_position_model.dart';
import 'package:geocoding/geocoding.dart';

class GeocodingService {
  Future<DeviceAdressModel> getDeviceAdress(
      DevicePositionModel devicePosition) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(
        devicePosition.latitude, devicePosition.longitude);
    return DeviceAdressModel.fromPlacemark(placemarks[0]);
  }
}
