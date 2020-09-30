import 'package:covid_app/app/model/result_firebase.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class BaseAuth {
  Future<VoidResult> signIn(String email, String password);

  Future<VoidResult> signUp(String email, String password);

  Future<VoidResult> resetPassword(String email);

  Future<FirebaseUser> getCurrentUser();

  Future<void> sendEmailVerification();

  Future<void> signOut();

  Future<bool> isEmailVerified();
}
