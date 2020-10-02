import 'package:covid_app/app/model/result_firebase.dart';
import 'package:covid_app/app/model/user.dart';

abstract class BaseFireStore {
  Future<VoidResult> createUser(String userUID, User user);
  void getBasicUserData(String userUID);
}
