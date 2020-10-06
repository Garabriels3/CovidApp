import 'package:covid_app/app/model/covid_symptom.dart';
import 'package:flutter/foundation.dart';

class QuizParameters {
  final List<CovidSymptoms> symptoms;

  QuizParameters({
    this.symptoms,
  });

  static QuizParameters fromMap(Map map) {
    final List symptomsMapList = map["questionsSymptoms"];
    final List<CovidSymptoms> symptoms =
        symptomsMapList.map((e) => CovidSymptoms.fromMap(e)).toList();

    return QuizParameters(symptoms: symptoms);
  }
}
