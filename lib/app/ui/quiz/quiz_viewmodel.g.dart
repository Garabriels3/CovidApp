// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$QuizViewModel on _QuizViewModelBase, Store {
  final _$symptomsAtom = Atom(name: '_QuizViewModelBase.symptoms');

  @override
  List<CovidSymptoms> get symptoms {
    _$symptomsAtom.reportRead();
    return super.symptoms;
  }

  @override
  set symptoms(List<CovidSymptoms> value) {
    _$symptomsAtom.reportWrite(value, super.symptoms, () {
      super.symptoms = value;
    });
  }

  final _$questionsAtom = Atom(name: '_QuizViewModelBase.questions');

  @override
  List<TypeQuestions> get questions {
    _$questionsAtom.reportRead();
    return super.questions;
  }

  @override
  set questions(List<TypeQuestions> value) {
    _$questionsAtom.reportWrite(value, super.questions, () {
      super.questions = value;
    });
  }

  final _$stepValueAtom = Atom(name: '_QuizViewModelBase.stepValue');

  @override
  int get stepValue {
    _$stepValueAtom.reportRead();
    return super.stepValue;
  }

  @override
  set stepValue(int value) {
    _$stepValueAtom.reportWrite(value, super.stepValue, () {
      super.stepValue = value;
    });
  }

  final _$questionTitleAtom = Atom(name: '_QuizViewModelBase.questionTitle');

  @override
  String get questionTitle {
    _$questionTitleAtom.reportRead();
    return super.questionTitle;
  }

  @override
  set questionTitle(String value) {
    _$questionTitleAtom.reportWrite(value, super.questionTitle, () {
      super.questionTitle = value;
    });
  }

  final _$commonScoreAtom = Atom(name: '_QuizViewModelBase.commonScore');

  @override
  int get commonScore {
    _$commonScoreAtom.reportRead();
    return super.commonScore;
  }

  @override
  set commonScore(int value) {
    _$commonScoreAtom.reportWrite(value, super.commonScore, () {
      super.commonScore = value;
    });
  }

  final _$severalScoreAtom = Atom(name: '_QuizViewModelBase.severalScore');

  @override
  int get severalScore {
    _$severalScoreAtom.reportRead();
    return super.severalScore;
  }

  @override
  set severalScore(int value) {
    _$severalScoreAtom.reportWrite(value, super.severalScore, () {
      super.severalScore = value;
    });
  }

  final _$listSymptonsAtom = Atom(name: '_QuizViewModelBase.listSymptons');

  @override
  List<Tag> get listSymptons {
    _$listSymptonsAtom.reportRead();
    return super.listSymptons;
  }

  @override
  set listSymptons(List<Tag> value) {
    _$listSymptonsAtom.reportWrite(value, super.listSymptons, () {
      super.listSymptons = value;
    });
  }

  final _$listQuestionAtom = Atom(name: '_QuizViewModelBase.listQuestion');

  @override
  List<Tag> get listQuestion {
    _$listQuestionAtom.reportRead();
    return super.listQuestion;
  }

  @override
  set listQuestion(List<Tag> value) {
    _$listQuestionAtom.reportWrite(value, super.listQuestion, () {
      super.listQuestion = value;
    });
  }

  final _$getSymptomsAsyncAction =
      AsyncAction('_QuizViewModelBase.getSymptoms');

  @override
  Future<List<Tag>> getSymptoms() {
    return _$getSymptomsAsyncAction.run(() => super.getSymptoms());
  }

  final _$getQuestionsAsyncAction =
      AsyncAction('_QuizViewModelBase.getQuestions');

  @override
  Future<List<Tag>> getQuestions() {
    return _$getQuestionsAsyncAction.run(() => super.getQuestions());
  }

  final _$onContinueClickAsyncAction =
      AsyncAction('_QuizViewModelBase.onContinueClick');

  @override
  Future<void> onContinueClick(dynamic context, bool isNext) {
    return _$onContinueClickAsyncAction
        .run(() => super.onContinueClick(context, isNext));
  }

  final _$_QuizViewModelBaseActionController =
      ActionController(name: '_QuizViewModelBase');

  @override
  void captureScore() {
    final _$actionInfo = _$_QuizViewModelBaseActionController.startAction(
        name: '_QuizViewModelBase.captureScore');
    try {
      return super.captureScore();
    } finally {
      _$_QuizViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void verifySymptomsScore(CovidSymptoms element) {
    final _$actionInfo = _$_QuizViewModelBaseActionController.startAction(
        name: '_QuizViewModelBase.verifySymptomsScore');
    try {
      return super.verifySymptomsScore(element);
    } finally {
      _$_QuizViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
symptoms: ${symptoms},
questions: ${questions},
stepValue: ${stepValue},
questionTitle: ${questionTitle},
commonScore: ${commonScore},
severalScore: ${severalScore},
listSymptons: ${listSymptons},
listQuestion: ${listQuestion}
    ''';
  }
}
