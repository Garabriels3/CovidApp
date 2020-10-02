import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covid_app/app/model/result_firebase.dart';
import 'package:covid_app/app/model/user.dart';
import 'base_firestore.dart';

class FirebaseStore implements BaseFireStore {
  Firestore databaseReference = Firestore();

  @override
  Future<VoidResult> createUser(String userUID, User user) async {
    try {
      await databaseReference
          .collection("users")
          .document(userUID)
          .setData({'name': user.name, 'email': user.email}).catchError(
              (err) => print(err));
      return VoidResult();
    } catch (e) {
      return VoidResult(errorMessage: e.toString());
    }
  }

  @override
  Future<Result<User>> getBasicUserData(String userUID) async {
    DocumentSnapshot data;
    try {
      data =
          await databaseReference.collection("users").document(userUID).get();
      final user = User.fromMap(data.data);
      return Result(item: user);
    } catch (e) {
      return Result(errorMessage: e.toString());
    }
  }
}
