import 'package:covid_app/app/service/firebase/firebase_auth_impl.dart';
import 'package:mobx/mobx.dart';

part 'register_viewmodel.g.dart';

class RegisterViewModel = _RegisterViewModelBase with _$RegisterViewModel;

abstract class _RegisterViewModelBase with Store {
  @observable
  String email = "";

  @observable
  String password = "";

  final _auth = Auth();
  String userId;

  @action
  changeEmail(String newEmail) => email = newEmail;

  @action
  changePassword(String newPassword) => password = newPassword;

  String emailIsValid() {
    if (email.isNotEmpty && !email.contains("@")) {
      return "Formato de e-mail invalido!";
    } else {
      return null;
    }
  }

  String passwordIsValid() {
    if (password.isNotEmpty && password.length < 8) {
      return "Senha deve conter pelo menos 8 caracteres";
    } else {
      return null;
    }
  }

  bool emailIsValidButton() {
    if (email.isEmpty) {
      return false;
    } else if (!email.contains("@")) {
      return false;
    }
    return true;
  }

  bool passwordIsValidButton() {
    if (password.isEmpty) {
      return false;
    } else if (password.length < 8) {
      return false;
    }
    return true;
  }

  @computed
  bool get formIsValid {
    return emailIsValidButton() == true && passwordIsValidButton() == true;
  }

  @action
  Future<void> firebaseRegister(dynamic context) async {
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await _auth.signUp(email, password).then((value) => userId = value);
      } else {}
    } catch (Exception) {
      print("Login Error: $Exception");
    }
  }
}
