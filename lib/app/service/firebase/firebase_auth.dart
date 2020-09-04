import 'package:covid_app/app/model/result_firebase.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class BaseAuth {
  Future<VoidResult> signIn(String email, String password);

  Future<String> signUp(String email, String password);

  Future<FirebaseUser> getCurrentUser();

  Future<void> sendEmailVerification();

  Future<void> signOut();

  Future<bool> isEmailVerified();
}
