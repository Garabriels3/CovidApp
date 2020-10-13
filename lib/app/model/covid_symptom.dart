import 'package:cloud_firestore/cloud_firestore.dart';

class CovidSymptoms {
  String symptom;
  bool isSevere;

  CovidSymptoms({this.symptom, this.isSevere});

  static CovidSymptoms fromMap(Map map) {
    final String symptom = map["symptom"];
    final bool isSevere = map["isSevere"];

    return CovidSymptoms(symptom: symptom, isSevere: isSevere);
  }

  Map<String, dynamic> toJson() {
    return {"symptom": symptom, "isSevere": isSevere};
  }
}
