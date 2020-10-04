import 'package:covid_app/app/model/covid_symptom.dart';
import 'package:covid_app/app/model/questions.dart';
import 'package:covid_app/app/model/typeQuestions.dart';
import 'package:covid_app/app/service/firebase_store/firebase_store.dart';
import 'package:covid_app/app/ui/containers/questions/questions_container.dart';
import 'package:covid_app/app/ui/containers/quiz/quiz_container.dart';
import 'package:covid_app/app/ui/containers/symptoms/symptoms_container.dart';
import 'package:covid_app/app/utils/empty_state.dart';
import 'package:covid_app/core/constants/string.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_tags/selectable_tags.dart';
import 'package:mobx/mobx.dart';

part 'quiz_viewmodel.g.dart';

class QuizViewModel = _QuizViewModelBase with _$QuizViewModel;

enum Screen { FEELING_WELL, SYMPTOMS, QUESTIONS, RESULT }

abstract class _QuizViewModelBase with Store {
  @observable
  List<CovidSymptoms> symptoms;

  @observable
  List<TypeQuestions> questions;

  @observable
  var stepValue = 0;

  @observable
  var questionTitle = SECOND_STEP_QUESTION_TEXT;

  @observable
  int commonScore = 0;

  @observable
  int severalScore = 0;

  final _store = FirebaseStore();

  @observable
  List<Tag> listSymptons = [];

  @observable
  List<Tag> listQuestion = [];

  @action
  Future<List<Tag>> getSymptoms() async {
    final result = await _store.getSymptomsData();
    listSymptons.clear();

    if (result.success) {
      symptoms = result.item;
      listSymptons.addAll(
        symptoms.map(
          (e) => Tag(title: "${e.symptom}", active: false, customData: e),
        ),
      );
      return listSymptons;
    } else {
      return listSymptons;
    }
  }

  @action
  Future<List<Tag>> getQuestions() async {
    final result = await _store.getQuestionList();
    listQuestion.clear();

    if (result.success) {
      questions = result.item;
      listQuestion.addAll(
        questions.map(
          (e) => Tag(title: "${e.question}", active: false, customData: e),
        ),
      );
      return listQuestion;
    } else {
      return listQuestion;
    }
  }

  Widget widgetForCurrentPosition() {
    switch (stepValue) {
      case 0:
        return SymptomsContainer();
        break;
      case 1:
        return QuestionsContainer();
        break;
      default:
        return QuestionsContainer();
        break;
    }
  }

  @action
  Future<void> onContinueClick(context, bool isNext) async {
    switch (stepValue) {
      case 0:
        if (isNext) {
          questionTitle = THIRD_STEP_QUESTION_TEXT;
          stepValue++;
          captureScore();
        } else {
          Navigator.pop(context);
        }
        break;
      case 1:
        if (!isNext) {
          questionTitle = SECOND_STEP_QUESTION_TEXT;
          stepValue--;
        } else {
          // await saveData(context);
        }
        break;
      default:
    }
  }

  @action
  void captureScore() {
    final allegedSymptoms = listSymptons
        .where((element) => element.active)
        .map((e) => e.customData as CovidSymptoms)
        .toList();

    allegedSymptoms.forEach((element) {
      verifySymptomsScore(element);
    });
  }

  @action
  void verifySymptomsScore(CovidSymptoms element) {
    if (element.isSevere == true) {
      severalScore++;
      print(severalScore);
    } else {
      commonScore++;
      print(commonScore);
    }
  }
}
