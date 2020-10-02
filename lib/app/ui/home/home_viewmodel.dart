import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covid_app/app/model/user.dart';
import 'package:covid_app/app/service/remote/firebase_auth/firebase_auth_impl.dart';
import 'package:covid_app/app/service/remote/firebase_store/firebase_store.dart';
import 'package:covid_app/app/ui/login/login_page.dart';
import 'package:covid_app/app/utils/generic_dialog.dart';
import 'package:covid_app/core/constants/string.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'home_viewmodel.g.dart';

class HomeViewModel = _HomeViewModelBase with _$HomeViewModel;

abstract class _HomeViewModelBase with Store {

  Auth authService = Auth();
  FirebaseStore store = FirebaseStore();

  void signOut(context) async {
    var success = await authService.signOut();
    if (success.success) {
      Navigator.push(context,
          MaterialPageRoute(builder: (BuildContext context) => LoginPage()));
    } else {
      genericDialog(context, "Erro ao sair",
          GENERIC_ERROR_MESSAGE_TRY_AGAIN_LATER, () => Navigator.pop(context));
    }
  }
}
