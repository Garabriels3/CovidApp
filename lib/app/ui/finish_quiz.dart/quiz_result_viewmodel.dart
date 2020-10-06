import 'package:covid_app/app/model/user.dart';
import 'package:covid_app/app/service/local/shared_preferences.dart';
import 'package:covid_app/core/constants/string.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
part 'quiz_result_viewmodel.g.dart';

class QuizResultViewModel = _QuizResultViewModelBase with _$QuizResultViewModel;

abstract class _QuizResultViewModelBase with Store {
  @observable
  User user = User();

  final _cache = SharedPreferencesCache();

  @action
  Future<void> getValueCache() async {
    user.email = await _cache.getStringToSF(emailKey);
    user.name = await _cache.getStringToSF(nameKey);
  }

  void launchURL() async {
    const url = urlMakeExam;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
