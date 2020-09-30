import 'package:covid_app/app/model/user.dart';
import 'package:covid_app/app/service/firebaseAuth/firebase_auth_impl.dart';
import 'package:covid_app/app/service/firebase_store/create_user_firestore.dart';
import 'package:covid_app/app/ui/login/login_page.dart';
import 'package:covid_app/app/utils/generic_dialog.dart';
import 'package:covid_app/core/constants/string.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'register_viewmodel.g.dart';

class RegisterViewModel = _RegisterViewModelBase with _$RegisterViewModel;

abstract class _RegisterViewModelBase with Store {
  @observable
  String email = "";

  @observable
  String password = "";

  @observable
  String name = "";

  final _auth = Auth();

  final _store = CreateUserFireStore();

  String userId;

  @action
  changeEmail(String newEmail) => email = newEmail;

  @action
  changePassword(String newPassword) => password = newPassword;

  @action
  changeName(String newName) => name = newName;

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

  bool nameIsValidButton() {
    if (name.isEmpty) {
      return false;
    }
    return true;
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
    return emailIsValidButton() == true &&
        passwordIsValidButton() == true &&
        nameIsValidButton() == true;
  }

  @action
  Future<void> firebaseRegister(dynamic context) async {
    var result = await _auth.signUp(email, password);
    userId = result.userId;
    sendEmailVerification(result.success);
    createAccountFireStore(result.success, userUID: userId);
    result.success
        ? genericDialog(context, registerSuccess, registerSucessOrientation,
            () => goToLogin(context))
        : genericDialog(context, wrongDataInRegister, wrongDataInOrientation,
            () => Navigator.pop(context));
  }

  Future<void> sendEmailVerification(bool success) async {
    if (success) _auth.sendEmailVerification();
  }

  Future<void> createAccountFireStore(bool success, {String userUID}) async {
    User user = User();
    user.email = email;
    user.name = name;

    if (user.email != null && user.name != null) {
      if (success) await _store.createUser(userUID, user);
    }
  }

  void goToLogin(context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => LoginPage()));
  }
}
