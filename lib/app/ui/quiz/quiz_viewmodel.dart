import 'package:covid_app/app/model/covid_symptom.dart';
import 'package:covid_app/app/model/questions.dart';
import 'package:covid_app/app/model/typeQuestions.dart';
import 'package:covid_app/app/model/user.dart';
import 'package:covid_app/app/service/firebase_store/firebase_store.dart';
import 'package:covid_app/app/service/local/shared_preferences.dart';
import 'package:covid_app/app/ui/containers/questions/questions_container.dart';
import 'package:covid_app/app/ui/containers/quiz/quiz_container.dart';
import 'package:covid_app/app/ui/containers/symptoms/symptoms_container.dart';
import 'package:covid_app/app/ui/finish_quiz.dart/quiz_result.dart';
import 'package:covid_app/app/utils/empty_state.dart';
import 'package:covid_app/core/constants/string.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tags/selectable_tags.dart';
import 'package:mobx/mobx.dart';

part 'quiz_viewmodel.g.dart';

class QuizViewModel = _QuizViewModelBase with _$QuizViewModel;

abstract class _QuizViewModelBase with Store {
  @observable
  var stepValue = 0;

  @observable
  var questionTitle = SECOND_STEP_QUESTION_TEXT;

  @observable
  int commonScore = 0;

  @observable
  int severalScore = 0;

  @observable
  bool isBadResult = false;

  @observable
  bool isRegularResult = false;

  @observable
  bool isGoodResult = false;

  @observable
  String orientarionLabel = "";

  @observable
  List<Tag> listSymptoms = [];

  @observable
  List<Tag> listQuestion = [];

  final _store = FirebaseStore();

  @action
  Future getSymptoms() async {
    final result = await _store.getSymptomsData();
    listSymptoms.clear();

    if (result.success) {
      List<CovidSymptoms> symptoms = result.item;
      listSymptoms.addAll(
        symptoms.map(
          (e) => Tag(title: "${e.symptom}", active: false, customData: e),
        ),
      );
    }
  }

  @action
  Future getQuestions() async {
    final result = await _store.getQuestionList();
    listQuestion.clear();

    if (result.success) {
      List<TypeQuestions> questions = result.item;
      listQuestion.addAll(
        questions.map(
          (e) => Tag(title: "${e.question}", customData: e),
        ),
      );
    }
  }

  Widget widgetForCurrentPosition() {
    switch (stepValue) {
      case 0:
        return SymptomsContainer(vm: this);
        break;
      case 1:
        return QuestionsContainer(vm: this);
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
        } else {
          Navigator.pop(context);
        }
        break;
      case 1:
        if (!isNext) {
          questionTitle = SECOND_STEP_QUESTION_TEXT;
          stepValue--;
        } else {
          captureScore();
          calculateTotalScore();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => QuizResult(
                orientationLabel: orientarionLabel,
                isBadResult: isBadResult,
              ),
            ),
          );
          // await saveData(context);
        }
        break;
      default:
    }
  }

  @action
  void captureScore() {
    final allegedSymptoms = listSymptoms
        .where((element) => element.active == true)
        .map((e) => e.customData as CovidSymptoms)
        .where((element) => element != null)
        .toList();

    final allegedQuestions = listQuestion
        .where((element) => element.active == true)
        .map((e) => e.customData as TypeQuestions)
        .where((element) => element != null)
        .toList();

    print(allegedSymptoms);

    allegedSymptoms.forEach((element) {
      verifySymptomsScore(element);
    });

    allegedQuestions.forEach((element) {
      verifyQuestionScore(element);
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

  @action
  void verifyQuestionScore(TypeQuestions element) {
    if (element.isSevere == true) {
      severalScore++;
      print(severalScore);
    } else {
      commonScore++;
      print(commonScore);
    }
  }

  @action
  void calculateTotalScore() {
    if (commonScore > 0 && severalScore > 0) {
      isBadResult = true;
      orientarionLabel = BAD_RESULT;
    } else if (commonScore > 3 && severalScore == 0) {
      isBadResult = true;
      orientarionLabel = REGULAR_RESULT;
    } else if (commonScore < 4 && severalScore == 0) {
      isBadResult = false;
      orientarionLabel = GOOD_RESULT;
    } else if (severalScore > 0) {
      isBadResult = true;
      orientarionLabel = BAD_RESULT;
    }
  }
}
