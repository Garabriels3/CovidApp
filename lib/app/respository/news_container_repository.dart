import 'package:covid_app/app/model/articles.dart';
import 'package:covid_app/app/service/api/api_client.dart';
import 'package:covid_app/core/constants/string.dart';
import 'package:dio/dio.dart';

class NewsContainerRepository {
  final ApiClient serviceApi = ApiClient();

  Future<List<Articles>> getPosts() async {
    try {
      var response = await ApiClient.dio.get(baseUrl);
      return (response.data[articlesJsonList] as List)
          .map((item) => Articles.fromJson(item))
          .toList();
    } on DioError catch (e) {
      throw (e.message);
    }
  }
}
