// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_result_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$QuizResultViewModel on _QuizResultViewModelBase, Store {
  final _$userAtom = Atom(name: '_QuizResultViewModelBase.user');

  @override
  User get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(User value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  final _$getValueCacheAsyncAction =
      AsyncAction('_QuizResultViewModelBase.getValueCache');

  @override
  Future<void> getValueCache() {
    return _$getValueCacheAsyncAction.run(() => super.getValueCache());
  }

  @override
  String toString() {
    return '''
user: ${user}
    ''';
  }
}
