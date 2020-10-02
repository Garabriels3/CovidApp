import 'package:covid_app/app/model/device_position_model.dart';
import 'package:geolocator/geolocator.dart';

class GeolocatorService {
  Future<bool> checkDevicePermission() async {
    LocationPermission permission = await checkPermission();
    switch (permission) {
      case LocationPermission.always:
      case LocationPermission.whileInUse:
        return true;
      default:
        return false;
    }
  }

  Future<bool> requestDevicePermission() async {
    LocationPermission permission = await requestPermission();
    switch (permission) {
      case LocationPermission.always:
      case LocationPermission.whileInUse:
        return true;
      default:
        return false;
    }
  }

  Future<DevicePositionModel> getCurrentDevicePosition() async {
    Position position =
        await getCurrentPosition(desiredAccuracy: LocationAccuracy.medium);
    return DevicePositionModel.fromPosition(position);
  }
}
