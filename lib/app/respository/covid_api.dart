import 'package:covid_app/app/model/covid_api_model.dart';
import 'package:covid_app/app/service/api/api_client.dart';
import 'package:dio/dio.dart';

class CovidApiRepository {
  final ApiClient serviceApi = ApiClient();

  Future<CovidApiModel> getApiData(
      {String uf, String country = "brazil"}) async {
    try {
      Response response = await ApiClient.dio
          .get("https://covid19-brazil-api.now.sh/api/report/v1/brazil/uf/$uf");
      if (response.data['error'] != "state not found") {
        CovidApiModel model =
            CovidApiModel.fromJsonToModelWithState(response.data);
        return model;
      } else {
        Response response = await ApiClient.dio
            .get("https://covid19-brazil-api.now.sh/api/report/v1/$country");
        CovidApiModel model =
            CovidApiModel.fromJsonToModelWithCountry(response.data['data']);
        return model;
      }
    } on DioError catch (e) {
      throw (e.message);
    }
  }
}
