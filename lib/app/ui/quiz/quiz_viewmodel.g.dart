// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$QuizViewModel on _QuizViewModelBase, Store {
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

  final _$currentUserAtom = Atom(name: '_QuizViewModelBase.currentUser');

  @override
  String get currentUser {
    _$currentUserAtom.reportRead();
    return super.currentUser;
  }

  @override
  set currentUser(String value) {
    _$currentUserAtom.reportWrite(value, super.currentUser, () {
      super.currentUser = value;
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

  final _$isBadResultAtom = Atom(name: '_QuizViewModelBase.isBadResult');

  @override
  bool get isBadResult {
    _$isBadResultAtom.reportRead();
    return super.isBadResult;
  }

  @override
  set isBadResult(bool value) {
    _$isBadResultAtom.reportWrite(value, super.isBadResult, () {
      super.isBadResult = value;
    });
  }

  final _$isRegularResultAtom =
      Atom(name: '_QuizViewModelBase.isRegularResult');

  @override
  bool get isRegularResult {
    _$isRegularResultAtom.reportRead();
    return super.isRegularResult;
  }

  @override
  set isRegularResult(bool value) {
    _$isRegularResultAtom.reportWrite(value, super.isRegularResult, () {
      super.isRegularResult = value;
    });
  }

  final _$isGoodResultAtom = Atom(name: '_QuizViewModelBase.isGoodResult');

  @override
  bool get isGoodResult {
    _$isGoodResultAtom.reportRead();
    return super.isGoodResult;
  }

  @override
  set isGoodResult(bool value) {
    _$isGoodResultAtom.reportWrite(value, super.isGoodResult, () {
      super.isGoodResult = value;
    });
  }

  final _$orientarionLabelAtom =
      Atom(name: '_QuizViewModelBase.orientarionLabel');

  @override
  String get orientarionLabel {
    _$orientarionLabelAtom.reportRead();
    return super.orientarionLabel;
  }

  @override
  set orientarionLabel(String value) {
    _$orientarionLabelAtom.reportWrite(value, super.orientarionLabel, () {
      super.orientarionLabel = value;
    });
  }

  final _$listSymptomsAtom = Atom(name: '_QuizViewModelBase.listSymptoms');

  @override
  List<Tag> get listSymptoms {
    _$listSymptomsAtom.reportRead();
    return super.listSymptoms;
  }

  @override
  set listSymptoms(List<Tag> value) {
    _$listSymptomsAtom.reportWrite(value, super.listSymptoms, () {
      super.listSymptoms = value;
    });
  }

  final _$allegedSymptomsAtom =
      Atom(name: '_QuizViewModelBase.allegedSymptoms');

  @override
  List<CovidSymptoms> get allegedSymptoms {
    _$allegedSymptomsAtom.reportRead();
    return super.allegedSymptoms;
  }

  @override
  set allegedSymptoms(List<CovidSymptoms> value) {
    _$allegedSymptomsAtom.reportWrite(value, super.allegedSymptoms, () {
      super.allegedSymptoms = value;
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

  final _$deviceAdressAtom = Atom(name: '_QuizViewModelBase.deviceAdress');

  @override
  DeviceAdressModel get deviceAdress {
    _$deviceAdressAtom.reportRead();
    return super.deviceAdress;
  }

  @override
  set deviceAdress(DeviceAdressModel value) {
    _$deviceAdressAtom.reportWrite(value, super.deviceAdress, () {
      super.deviceAdress = value;
    });
  }

  final _$getSymptomsAsyncAction =
      AsyncAction('_QuizViewModelBase.getSymptoms');

  @override
  Future<dynamic> getSymptoms() {
    return _$getSymptomsAsyncAction.run(() => super.getSymptoms());
  }

  final _$getQuestionsAsyncAction =
      AsyncAction('_QuizViewModelBase.getQuestions');

  @override
  Future<dynamic> getQuestions() {
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
  void verifyQuestionScore(TypeQuestions element) {
    final _$actionInfo = _$_QuizViewModelBaseActionController.startAction(
        name: '_QuizViewModelBase.verifyQuestionScore');
    try {
      return super.verifyQuestionScore(element);
    } finally {
      _$_QuizViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void calculateTotalScore() {
    final _$actionInfo = _$_QuizViewModelBaseActionController.startAction(
        name: '_QuizViewModelBase.calculateTotalScore');
    try {
      return super.calculateTotalScore();
    } finally {
      _$_QuizViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
stepValue: ${stepValue},
currentUser: ${currentUser},
questionTitle: ${questionTitle},
commonScore: ${commonScore},
severalScore: ${severalScore},
isBadResult: ${isBadResult},
isRegularResult: ${isRegularResult},
isGoodResult: ${isGoodResult},
orientarionLabel: ${orientarionLabel},
listSymptoms: ${listSymptoms},
allegedSymptoms: ${allegedSymptoms},
listQuestion: ${listQuestion},
deviceAdress: ${deviceAdress}
    ''';
  }
}
