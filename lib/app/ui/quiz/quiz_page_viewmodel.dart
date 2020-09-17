import 'package:covid_app/app/model/covid_api_model.dart';
import 'package:covid_app/app/model/device_adress_model.dart';
import 'package:covid_app/app/model/device_position_model.dart';
import 'package:covid_app/app/respository/covid_api.dart';
import 'package:covid_app/app/service/geolocator/geocoding_service.dart';
import 'package:covid_app/app/service/geolocator/geolocator_service.dart';
import 'get_uf_viewmodel.dart';

class QuizPageViewModel {
  final GetUfViewModel ufVm;
  final GeolocatorService geolocatorService;
  final GeocodingService geocodingService;
  final CovidApiRepository repository;

  QuizPageViewModel(this.geolocatorService, this.geocodingService,
      this.repository, this.ufVm);

  Future<DevicePositionModel> getCurrentPosition() async {
    DevicePositionModel positionModel =
        await geolocatorService.getCurrentDevicePosition();
    return positionModel;
  }

  Future<DeviceAdressModel> getCurrentAdress(
      DevicePositionModel positionModel) async {
    DeviceAdressModel adressModel =
        await geocodingService.getCurrentAdressDevice(positionModel);
    return adressModel;
  }

  Future<CovidApiModel> getApiData(String uf) async {
    CovidApiModel apiModel = await repository.getApiData(uf);
    return apiModel;
  }

  Future<CovidApiModel> getData() async {
    DevicePositionModel positionModel = await getCurrentPosition();
    DeviceAdressModel adressModel = await getCurrentAdress(positionModel);
    String uf = ufVm.getUf(adressModel.administrativeArea);
    CovidApiModel apiModel = await repository.getApiData(uf);
    return apiModel;
  }
}
