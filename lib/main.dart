import 'package:covid_app/covid_app.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'app/respository/covid_api.dart';
import 'app/service/geocoding/geocoding_service.dart';
import 'app/service/geolocator/geolocator_service.dart';

void main() {
  GetIt getIt = GetIt.I;
  getIt.registerSingleton<GeocodingService>(GeocodingService());
  getIt.registerSingleton<GeolocatorService>(GeolocatorService());
  getIt.registerSingleton<CovidApiRepository>(CovidApiRepository());
  runApp(CovidApp());
}
