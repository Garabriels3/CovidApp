import 'package:covid_app/app/model/device_position_model.dart';
import 'package:geolocator/geolocator.dart';

class GeolocatorService {
  Future<bool> checkDevicePermission() async {
    LocationPermission permission = await checkPermission();
    switch (permission) {
      case LocationPermission.always:
        return true;
      case LocationPermission.whileInUse:
        return true;
      default:
        return false;
    }
  }

  Future<DevicePositionModel> getDevicePosition() async {
    bool check = await checkDevicePermission();
    if (check) {
      Position position =
          await getCurrentPosition(desiredAccuracy: LocationAccuracy.medium);
      return DevicePositionModel.fromPosition(position);
    } else {
      return null;
    }
  }
}
