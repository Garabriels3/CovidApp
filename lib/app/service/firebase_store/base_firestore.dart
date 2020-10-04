import 'package:covid_app/app/model/covid_symptom.dart';
import 'package:covid_app/app/model/questions.dart';
import 'package:covid_app/app/model/result_firebase.dart';
import 'package:covid_app/app/model/typeQuestions.dart';
import 'package:covid_app/app/model/user.dart';

abstract class BaseFireStore {
  Future<VoidResult> createUser(String userUID, User user);
  Future<Result<User>> getBasicUserData(String userUID);
  Future<Result<List<CovidSymptoms>>> getSymptomsData();
  Future<Result<List<TypeQuestions>>> getQuestionList();
}
