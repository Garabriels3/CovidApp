import 'package:covid_app/app/service/firebase/firebase_auth_impl.dart';
import 'package:covid_app/app/utils/generic_dialog.dart';
import 'package:covid_app/core/constants/string.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'forgot_password_viewmodel.g.dart';

class ForgotPasswordViewModel = _ForgotPasswordViewModelBase
    with _$ForgotPasswordViewModel;

abstract class _ForgotPasswordViewModelBase with Store {
  @observable
  String email = "";

  TextEditingController controller;

  @observable
  bool result;

  Auth _auth = Auth();

  @action
  changeEmail(String newEmail) => email = newEmail;

  String emailIsValid() {
    if (email.isNotEmpty && !email.contains("@")) {
      return "Formato de e-mail invalido!";
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

  Future<void> resetPassword(context) async {
    await _auth.resetPassword(email).then((value) => result = value.success);
    result
        ? genericDialog(context, sendEmailSucess, sendEmailSucessOrientarion,
            () => Navigator.pop(context))
        : genericDialog(context, emailNotFound, wrongCredentialsOrientation,
            () => Navigator.pop(context));
  }
}
