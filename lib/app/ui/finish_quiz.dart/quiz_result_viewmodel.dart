import 'package:covid_app/app/model/user.dart';
import 'package:covid_app/app/service/local/shared_preferences.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'quiz_result_viewmodel.g.dart';

class QuizResultViewModel = _QuizResultViewModelBase with _$QuizResultViewModel;

abstract class _QuizResultViewModelBase with Store {
  
  @observable
  User user = User();

  final _cache = SharedPreferencesCache();

  @action
  Future<void> getValueCache() async {
    user.email = await _cache.getStringToSF("email");
    user.name = await _cache.getStringToSF("name");
  }
}
