import 'package:covid_app/app/model/device_adress_model.dart';
import 'package:covid_app/app/model/device_position_model.dart';
import 'package:geocoding/geocoding.dart';

class GeocodingService {
  Future<DeviceAdressModel> getCurrentAdressDevice(
      DevicePositionModel model) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(model.latitude, model.longitude);
    return DeviceAdressModel.fromPlacemark(placemarks[0]);
  }
}
