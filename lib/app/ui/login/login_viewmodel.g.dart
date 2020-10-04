// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginViewModel on LoginViewModelBase, Store {
  Computed<bool> _$formIsValidComputed;

  @override
  bool get formIsValid =>
      (_$formIsValidComputed ??= Computed<bool>(() => super.formIsValid,
              name: 'LoginViewModelBase.formIsValid'))
          .value;

  final _$emailAtom = Atom(name: 'LoginViewModelBase.email');

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$userAtom = Atom(name: 'LoginViewModelBase.user');

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

  final _$passwordAtom = Atom(name: 'LoginViewModelBase.password');

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  final _$errorAtom = Atom(name: 'LoginViewModelBase.error');

  @override
  bool get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(bool value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  final _$emailErrorLabelAtom =
      Atom(name: 'LoginViewModelBase.emailErrorLabel');

  @override
  bool get emailErrorLabel {
    _$emailErrorLabelAtom.reportRead();
    return super.emailErrorLabel;
  }

  @override
  set emailErrorLabel(bool value) {
    _$emailErrorLabelAtom.reportWrite(value, super.emailErrorLabel, () {
      super.emailErrorLabel = value;
    });
  }

  final _$passwordErrorLabelAtom =
      Atom(name: 'LoginViewModelBase.passwordErrorLabel');

  @override
  bool get passwordErrorLabel {
    _$passwordErrorLabelAtom.reportRead();
    return super.passwordErrorLabel;
  }

  @override
  set passwordErrorLabel(bool value) {
    _$passwordErrorLabelAtom.reportWrite(value, super.passwordErrorLabel, () {
      super.passwordErrorLabel = value;
    });
  }

  final _$userIdAtom = Atom(name: 'LoginViewModelBase.userId');

  @override
  String get userId {
    _$userIdAtom.reportRead();
    return super.userId;
  }

  @override
  set userId(String value) {
    _$userIdAtom.reportWrite(value, super.userId, () {
      super.userId = value;
    });
  }

  final _$firebaseLoginAsyncAction =
      AsyncAction('LoginViewModelBase.firebaseLogin');

  @override
  Future<void> firebaseLogin(dynamic context) {
    return _$firebaseLoginAsyncAction.run(() => super.firebaseLogin(context));
  }

  final _$LoginViewModelBaseActionController =
      ActionController(name: 'LoginViewModelBase');

  @override
  dynamic changeEmail(String newEmail) {
    final _$actionInfo = _$LoginViewModelBaseActionController.startAction(
        name: 'LoginViewModelBase.changeEmail');
    try {
      return super.changeEmail(newEmail);
    } finally {
      _$LoginViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changePassword(String newPassword) {
    final _$actionInfo = _$LoginViewModelBaseActionController.startAction(
        name: 'LoginViewModelBase.changePassword');
    try {
      return super.changePassword(newPassword);
    } finally {
      _$LoginViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setHasErrorOnEmail(bool value) {
    final _$actionInfo = _$LoginViewModelBaseActionController.startAction(
        name: 'LoginViewModelBase.setHasErrorOnEmail');
    try {
      return super.setHasErrorOnEmail(value);
    } finally {
      _$LoginViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setHasErrorOnPassword(bool value) {
    final _$actionInfo = _$LoginViewModelBaseActionController.startAction(
        name: 'LoginViewModelBase.setHasErrorOnPassword');
    try {
      return super.setHasErrorOnPassword(value);
    } finally {
      _$LoginViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
email: ${email},
user: ${user},
password: ${password},
error: ${error},
emailErrorLabel: ${emailErrorLabel},
passwordErrorLabel: ${passwordErrorLabel},
userId: ${userId},
formIsValid: ${formIsValid}
    ''';
  }
}
