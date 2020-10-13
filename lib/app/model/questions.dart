import 'package:covid_app/app/model/typeQuestions.dart';

class Questions {
  List<TypeQuestions> questions;

  Questions({this.questions});

  static Questions fromMap(Map map) {
    final List questionsMapList = map["questions"];
    final List<TypeQuestions> questions =
        questionsMapList.map((e) => TypeQuestions.fromMap(e)).toList();

    return Questions(questions: questions);
  }
}
