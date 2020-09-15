import 'package:covid_app/app/model/adress_device_model.dart';
import 'package:covid_app/app/model/device_position_model.dart';
import 'package:geocoding/geocoding.dart';

class GeocodingService {
  Future<AdressDeviceModel> getCurrentAdressDevice(
      DevicePositionModel model) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(model.latitude, model.longitude);
    return AdressDeviceModel.fromPlacemark(placemarks[0]);
  }
}
