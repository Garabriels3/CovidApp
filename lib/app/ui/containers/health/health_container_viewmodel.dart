import 'package:covid_app/app/model/device_position_model.dart';
import 'package:covid_app/app/service/geolocator/geolocator_service.dart';
import 'package:get_it/get_it.dart';

class HealthContainerViewModel {
  final geolocatorService = GetIt.I.get<GeolocatorService>();
  DevicePositionModel model;

  Future time() async {}
  Future<DevicePositionModel> getData() async {
    await Future.delayed(Duration(seconds: 13), () {});
    model = await geolocatorService.getDevicePosition();
    return model;
  }
}
