import 'package:covid_app/app/model/result_firebase.dart';
import 'package:covid_app/app/service/firebase/firebase_auth_impl.dart';
import 'package:covid_app/app/ui/home/home_page.dart';
import 'package:covid_app/core/constants/colors.dart';
import 'package:covid_app/core/constants/dimens.dart';
import 'package:covid_app/core/constants/string.dart';
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
  Future<void> firebaseLogin(dynamic context) async {
    var result = await _auth.signIn(email, password);
    result.success ? homeNavigator(context) : errorDialog(context);
  }

  void homeNavigator(context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomePage()));
  }

  Future errorDialog(dynamic context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(twentyFour)),
            ),
            title: Text(
              wrongCredentials,
              textAlign: TextAlign.center,
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  wrongCredentialsOrientation,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            actions: <Widget>[
              Container(
                margin: EdgeInsets.only(right: eighty),
                height: fortyFour,
                width: hundred,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      twentyFour,
                    ),
                  ),
                  child: Text(
                    dismissDialogs,
                    style: TextStyle(fontSize: sixteen),
                  ),
                  textColor: Colors.white,
                  color: darkPrimaryColor,
                  onPressed: () async {
                    Navigator.pop(context);
                  },
                ),
              )
            ],
          );
        });
  }
}
