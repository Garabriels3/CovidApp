import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covid_app/app/model/covid_symptom.dart';
import 'package:covid_app/app/model/device_adress_model.dart';
import 'package:covid_app/app/model/questions.dart';
import 'package:covid_app/app/model/quiz_parameters.dart';
import 'package:covid_app/app/model/result_firebase.dart';
import 'package:covid_app/app/model/typeQuestions.dart';
import 'package:covid_app/app/model/user.dart';
import 'package:covid_app/app/service/firebase_store/base_firestore.dart';

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

  @override
  Future<Result<List<CovidSymptoms>>> getSymptomsData() async {
    var data;
    try {
      data = await databaseReference
          .collection("symptoms")
          .document("rdwpuBBTMFQSRuLt8PCl")
          .get();
      var quizParameters = QuizParameters.fromMap(data.data);
      return Result(item: quizParameters.symptoms);
    } catch (e) {
      return Result(errorMessage: e.toString());
    }
  }

  @override
  Future<Result<List<TypeQuestions>>> getQuestionList() async {
    DocumentSnapshot data;
    try {
      data = await databaseReference
          .collection("questions")
          .document("hR4exjkOREcqzXU0DNcG")
          .get();
      var questions = Questions.fromMap(data.data);
      return Result(item: questions.questions);
    } catch (e) {
      return Result(errorMessage: e.toString());
    }
  }

  @override
  Future<VoidResult> setQuestionList(
      String userUid, List<CovidSymptoms> finalAnswer, String result) async {
    try {
      await databaseReference
          .collection("users")
          .document(userUid)
          .collection("quiz_answers")
          .document()
          .setData({
        "listAnswers":
            finalAnswer.map((finalAnswer) => finalAnswer.toJson()).toList(),
        "resultQuiz": result
      });
      return VoidResult();
    } catch (e) {
      return VoidResult(errorMessage: e.toString());
    }
  }
}
