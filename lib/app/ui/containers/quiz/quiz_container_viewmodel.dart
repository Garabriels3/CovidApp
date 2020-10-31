import 'package:covid_app/app/model/covid_api_model.dart';
import 'package:covid_app/app/model/device_adress_model.dart';
import 'package:covid_app/app/model/device_position_model.dart';
import 'package:covid_app/app/respository/covid_api.dart';
import 'package:covid_app/app/service/geocoding/geocoding_service.dart';
import 'package:covid_app/app/service/geolocator/geolocator_service.dart';
import 'package:covid_app/core/constants/string.dart';
import 'package:get_it/get_it.dart';

class QuizContainerViewModel {
  final geolocatorService = GetIt.I.get<GeolocatorService>();
  final geocodingService = GetIt.I.get<GeocodingService>();
  final repository = GetIt.I.get<CovidApiRepository>();

  Future<DevicePositionModel> getDevicePosition() async {
    DevicePositionModel devicePosition =
        await geolocatorService.getDevicePosition();
    if (devicePosition != null)
      return devicePosition;
    else
      return null;
  }

  Future<DeviceAdressModel> getDeviceAdress(
      DevicePositionModel devicePosition) async {
    DeviceAdressModel deviceAdress =
        await geocodingService.getDeviceAdress(devicePosition);
    return deviceAdress;
  }

  Future<CovidApiModel> getData() async {
    DevicePositionModel devicePosition = await getDevicePosition();
    if (devicePosition != null) {
      DeviceAdressModel deviceAdress = await getDeviceAdress(devicePosition);
      String uf = state(deviceAdress.administrativeArea);
      if (uf != null) {
        CovidApiModel apiModel = await repository.getApiData(uf: uf);
        return apiModel;
      } else {
        CovidApiModel apiModel = await repository.getApiData();
        return apiModel;
      }
    } else {
      CovidApiModel apiModel = await repository.getApiData();
      return apiModel;
    }
  }

  String state(String state) {
    switch (state) {
      case acre:
        return AC;
      case alagoas:
        return AL;
      case amapa:
        return AM;
      case amazonas:
        return AM;
      case bahia:
        return BA;
      case ceara:
        return CE;
      case distritoFederal:
        return DF;
      case espiritoSanto:
        return ES;
      case goias:
        return GO;
      case maranhao:
        return MA;
      case matoGrosso:
        return MT;
      case matoGrossoSul:
        return MS;
      case minasGerais:
        return MG;
      case para:
        return PA;
      case paraiba:
        return PB;
      case parana:
        return PR;
      case pernambuco:
        return PE;
      case piaui:
        return PI;
      case rioJaneiro:
        return RJ;
      case rioGrandeNorte:
        return RN;
      case rioGrandeSul:
        return RS;
      case rondonia:
        return RO;
      case roraima:
        return RR;
      case santaCatarina:
        return SC;
      case saoPaulo:
        return SP;
      case sergipe:
        return SE;
      case tocantins:
        return TO;
      default:
        return null;
    }
  }
}
