import 'package:covid_app/app/model/user.dart';
import 'package:covid_app/app/service/firebaseAuth/firebase_auth_impl.dart';
import 'package:covid_app/app/service/firebase_store/firebase_store.dart';
import 'package:covid_app/app/service/local/shared_preferences.dart';
import 'package:covid_app/app/ui/forgot_password/forgot_password_page.dart';
import 'package:covid_app/app/ui/home/home_page.dart';
import 'package:covid_app/app/ui/register/register_page.dart';
import 'package:covid_app/app/utils/generic_dialog.dart';
import 'package:covid_app/core/constants/string.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'login_viewmodel.g.dart';

class LoginViewModel = LoginViewModelBase with _$LoginViewModel;

abstract class LoginViewModelBase with Store {
  @observable
  String email = "";

  @observable
  User user = User();

  @observable
  String password = "";

  @observable
  bool error = false;

  @observable
  bool emailErrorLabel = false;

  @observable
  bool passwordErrorLabel = false;

  @observable
  String userId = "";

  final _auth = Auth();
  final store = FirebaseStore();
  final _cache = SharedPreferencesCache();

  String errorMessageLogin;

  @action
  changeEmail(String newEmail) => email = newEmail;

  @action
  changePassword(String newPassword) => password = newPassword;

  @action
  setHasErrorOnEmail(bool value) => emailErrorLabel = value;

  @action
  setHasErrorOnPassword(bool value) => passwordErrorLabel = value;

  String emailIsValid() {
    if (email.isNotEmpty && !email.contains("@")) {
      return "Formato de e-mail invalido!";
    } else {
      return null;
    }
  }

  String passwordIsValid() {
    if (password.isNotEmpty && password.length < 8) {
      return "";
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
  Future<void> firebaseLogin(dynamic context) async {
    var result = await _auth.signIn(email.trim(), password.trim());
    userId = result.userId;
    user = await store.getBasicUserData(userId).then((value) => value.item);

    if (result.success) {
      homeNavigator(context);
      saveDataInCache(user);
    } else {
      genericDialog(context, wrongCredentials, wrongCredentialsOrientation,
          () => Navigator.pop(context));
    }
  }

  void saveDataInCache(User user) {
    _cache.addStringToSF("name", user.name);
    _cache.addStringToSF("email", user.email);
  }

  void homeNavigator(context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomePage(user: user)));
  }

  void forgotPasswordNavigator(context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => FortgotPassword()));
  }

  void registerNavigator(context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) => RegisterPage()));
  }
}
