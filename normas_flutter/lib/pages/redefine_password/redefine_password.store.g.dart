// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'redefine_password.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RedefinePasswordStore on _RedefinePasswordStoreBase, Store {
  final _$passwordAtom = Atom(name: '_RedefinePasswordStoreBase.password');

  @override
  String get password {
    _$passwordAtom.context.enforceReadPolicy(_$passwordAtom);
    _$passwordAtom.reportObserved();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.context.conditionallyRunInAction(() {
      super.password = value;
      _$passwordAtom.reportChanged();
    }, _$passwordAtom, name: '${_$passwordAtom.name}_set');
  }

  final _$passwordConfirmAtom =
      Atom(name: '_RedefinePasswordStoreBase.passwordConfirm');

  @override
  String get passwordConfirm {
    _$passwordConfirmAtom.context.enforceReadPolicy(_$passwordConfirmAtom);
    _$passwordConfirmAtom.reportObserved();
    return super.passwordConfirm;
  }

  @override
  set passwordConfirm(String value) {
    _$passwordConfirmAtom.context.conditionallyRunInAction(() {
      super.passwordConfirm = value;
      _$passwordConfirmAtom.reportChanged();
    }, _$passwordConfirmAtom, name: '${_$passwordConfirmAtom.name}_set');
  }

  final _$_RedefinePasswordStoreBaseActionController =
      ActionController(name: '_RedefinePasswordStoreBase');

  @override
  dynamic changePassword(String value) {
    final _$actionInfo =
        _$_RedefinePasswordStoreBaseActionController.startAction();
    try {
      return super.changePassword(value);
    } finally {
      _$_RedefinePasswordStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changePasswordConfirm(String value) {
    final _$actionInfo =
        _$_RedefinePasswordStoreBaseActionController.startAction();
    try {
      return super.changePasswordConfirm(value);
    } finally {
      _$_RedefinePasswordStoreBaseActionController.endAction(_$actionInfo);
    }
  }
}
