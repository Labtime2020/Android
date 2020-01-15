// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SignUpStore on _SignUpStoreBase, Store {
  final _$imageAtom = Atom(name: '_SignUpStoreBase.image');

  @override
  File get image {
    _$imageAtom.context.enforceReadPolicy(_$imageAtom);
    _$imageAtom.reportObserved();
    return super.image;
  }

  @override
  set image(File value) {
    _$imageAtom.context.conditionallyRunInAction(() {
      super.image = value;
      _$imageAtom.reportChanged();
    }, _$imageAtom, name: '${_$imageAtom.name}_set');
  }

  final _$nameAtom = Atom(name: '_SignUpStoreBase.name');

  @override
  String get name {
    _$nameAtom.context.enforceReadPolicy(_$nameAtom);
    _$nameAtom.reportObserved();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.context.conditionallyRunInAction(() {
      super.name = value;
      _$nameAtom.reportChanged();
    }, _$nameAtom, name: '${_$nameAtom.name}_set');
  }

  final _$lastnameAtom = Atom(name: '_SignUpStoreBase.lastname');

  @override
  String get lastname {
    _$lastnameAtom.context.enforceReadPolicy(_$lastnameAtom);
    _$lastnameAtom.reportObserved();
    return super.lastname;
  }

  @override
  set lastname(String value) {
    _$lastnameAtom.context.conditionallyRunInAction(() {
      super.lastname = value;
      _$lastnameAtom.reportChanged();
    }, _$lastnameAtom, name: '${_$lastnameAtom.name}_set');
  }

  final _$emailAtom = Atom(name: '_SignUpStoreBase.email');

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

  final _$passwordAtom = Atom(name: '_SignUpStoreBase.password');

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

  final _$passwordConfirmAtom = Atom(name: '_SignUpStoreBase.passwordConfirm');

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

  final _$isAdminAtom = Atom(name: '_SignUpStoreBase.isAdmin');

  @override
  bool get isAdmin {
    _$isAdminAtom.context.enforceReadPolicy(_$isAdminAtom);
    _$isAdminAtom.reportObserved();
    return super.isAdmin;
  }

  @override
  set isAdmin(bool value) {
    _$isAdminAtom.context.conditionallyRunInAction(() {
      super.isAdmin = value;
      _$isAdminAtom.reportChanged();
    }, _$isAdminAtom, name: '${_$isAdminAtom.name}_set');
  }

  final _$_SignUpStoreBaseActionController =
      ActionController(name: '_SignUpStoreBase');

  @override
  dynamic changeImage(File value) {
    final _$actionInfo = _$_SignUpStoreBaseActionController.startAction();
    try {
      return super.changeImage(value);
    } finally {
      _$_SignUpStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeName(String value) {
    final _$actionInfo = _$_SignUpStoreBaseActionController.startAction();
    try {
      return super.changeName(value);
    } finally {
      _$_SignUpStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeLastName(String value) {
    final _$actionInfo = _$_SignUpStoreBaseActionController.startAction();
    try {
      return super.changeLastName(value);
    } finally {
      _$_SignUpStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeEmail(String value) {
    final _$actionInfo = _$_SignUpStoreBaseActionController.startAction();
    try {
      return super.changeEmail(value);
    } finally {
      _$_SignUpStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changePassword(String value) {
    final _$actionInfo = _$_SignUpStoreBaseActionController.startAction();
    try {
      return super.changePassword(value);
    } finally {
      _$_SignUpStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changePasswordConfirm(String value) {
    final _$actionInfo = _$_SignUpStoreBaseActionController.startAction();
    try {
      return super.changePasswordConfirm(value);
    } finally {
      _$_SignUpStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeIsAdmin(bool value) {
    final _$actionInfo = _$_SignUpStoreBaseActionController.startAction();
    try {
      return super.changeIsAdmin(value);
    } finally {
      _$_SignUpStoreBaseActionController.endAction(_$actionInfo);
    }
  }
}
