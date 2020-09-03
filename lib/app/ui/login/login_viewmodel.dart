import 'package:covid_app/app/service/firebase/firebase_auth.dart';
import 'package:covid_app/app/service/firebase/firebase_auth_impl.dart';
import 'package:covid_app/app/ui/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'login_viewmodel.g.dart';

class LoginViewModel = LoginViewModelBase with _$LoginViewModel;

abstract class LoginViewModelBase with Store {
  @observable
  String email = "";

  @observable
  String password = "";

  @observable
  bool error = false;

  @observable
  bool emailErrorLabel = false;

  @observable
  bool passwordErrorLabel = false;

  final _auth = Auth();

  @action
  changeEmail(String newEmail) => email = newEmail;

  @action
  changePassword(String newPassword) => password = newPassword;

  @action
  setHasErrorOnEmail(bool value) => emailErrorLabel = value;

  @action
  setHasErrorOnPassword(bool value) => passwordErrorLabel = value;

  String emailIsValid() {
    if (!email.isNotEmpty && !email.contains("@")) {
      return "Formato de e-mail invalido!";
    } else {
      return null;
    }
  }

  String passwordIsValid() {
    if (password.isEmpty) {
      return "Campo de senha vazio!";
    } else if (password.length < 8) {
      return "Senha deve conter pelo menos 8 caracteres";
    }
    return null;
  }

  @computed
  bool get formIsValid {
    return emailIsValid() == null && passwordIsValid() == null;
  }

  @action
  Future<void> firebaseLogin(dynamic context) async {
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        var userId;
        await _auth.signIn(email, password).then((value) => userId = value);
        userId.length > 0 ? homeNavigator(context) : error = true;
      } else {
        error = true;
      }
    } catch (Exception) {
      error = true;
      print("Login Error: $Exception");
    }
  }

  void homeNavigator(context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomePage()));
  }
}
