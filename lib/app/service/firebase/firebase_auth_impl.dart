import 'package:covid_app/app/model/result_firebase.dart';
import 'package:covid_app/core/constants/string.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'firebase_auth.dart';

class Auth implements BaseAuth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<VoidResult> signIn(String email, String password) async {
    try {
      AuthResult result = await _firebaseAuth.signInWithEmailAndPassword(
          email: email.trim(), password: password.trim());
      FirebaseUser user = result.user;
      return VoidResult(userId: user.uid);
    } catch (e) {
      return VoidResult(errorMessage: e.toString());
    }
  }

  Future<VoidResult> signUp(String email, String password) async {
    try {
      AuthResult result = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email.trim(), password: password.trim());
      FirebaseUser user = result.user;
      return VoidResult(userId: user.uid);
    } catch (e) {
      return VoidResult(errorMessage: e.toString());
    }
  }

  @override
  Future<VoidResult> resetPassword(String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
      return VoidResult();
    } catch (e) {
      return VoidResult(errorMessage: e.toString());
    }
  }

  Future<FirebaseUser> getCurrentUser() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    return user;
  }

  Future<VoidResult> signOut() async {
    try {
      await _firebaseAuth.signOut();
      return VoidResult();
    } catch (e) {
      return VoidResult(errorMessage: GENERIC_ERROR_MESSAGE_TRY_AGAIN_LATER);
    }
  }

  Future<void> sendEmailVerification() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    user.sendEmailVerification();
  }

  Future<bool> isEmailVerified() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    return user.isEmailVerified;
  }
}
