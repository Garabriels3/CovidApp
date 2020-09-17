import 'package:covid_app/app/model/covid_api_model.dart';
import 'package:dio/dio.dart';

class CovidApiRepository {
  Dio dio = Dio();

  Future<CovidApiModel> getApiData(String uf) async {
    Response response = await dio
        .get("https://covid19-brazil-api.now.sh/api/report/v1/brazil/uf/$uf");
    CovidApiModel model = CovidApiModel.fromJson(response.data);
    return model;
  }
}
