// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forgot_password.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ForgotPasswordStore on _ForgotPasswordStoreBase, Store {
  final _$emailAtom = Atom(name: '_ForgotPasswordStoreBase.email');

  @override
  String get email {
    _$emailAtom.context.enforceReadPolicy(_$emailAtom);
    _$emailAtom.reportObserved();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.context.conditionallyRunInAction(() {
      super.email = value;
      _$emailAtom.reportChanged();
    }, _$emailAtom, name: '${_$emailAtom.name}_set');
  }

  final _$_ForgotPasswordStoreBaseActionController =
      ActionController(name: '_ForgotPasswordStoreBase');

  @override
  dynamic changeEmail(String value) {
    final _$actionInfo =
        _$_ForgotPasswordStoreBaseActionController.startAction();
    try {
      return super.changeEmail(value);
    } finally {
      _$_ForgotPasswordStoreBaseActionController.endAction(_$actionInfo);
    }
  }
}
