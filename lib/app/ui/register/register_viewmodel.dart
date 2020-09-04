import 'package:covid_app/app/service/firebase/firebase_auth_impl.dart';
import 'package:mobx/mobx.dart';

part 'register_viewmodel.g.dart';

class RegisterViewModel = _RegisterViewModelBase with _$RegisterViewModel;

abstract class _RegisterViewModelBase with Store {

  @observable
  String email = "";

  @observable
  String password = "";

  @observable
  bool error = false;

  final _auth = Auth();
  String userId;

  @action
  changeEmail(String newEmail) => email = newEmail;

  @action
  changePassword(String newPassword) => password = newPassword;

    @action
  Future<void> firebaseLogin(dynamic context) async {
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await _auth.signUp(email, password).then((value) => userId = value);
      } else {
        error = true;
      }
    } catch (Exception) {
      error = true;
      print("Login Error: $Exception");
    }
  }
}