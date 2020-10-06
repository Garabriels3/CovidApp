// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_container_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$NewsContainerViewModel on _NewsContainerViewModelBase, Store {
  final _$dataAtom = Atom(name: '_NewsContainerViewModelBase.data');

  @override
  News get data {
    _$dataAtom.reportRead();
    return super.data;
  }

  @override
  set data(News value) {
    _$dataAtom.reportWrite(value, super.data, () {
      super.data = value;
    });
  }

  final _$getDataAsyncAction =
      AsyncAction('_NewsContainerViewModelBase.getData');

  @override
  Future<List<Articles>> getData() {
    return _$getDataAsyncAction.run(() => super.getData());
  }

  @override
  String toString() {
    return '''
data: ${data}
    ''';
  }
}
