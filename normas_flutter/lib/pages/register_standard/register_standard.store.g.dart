// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_standard.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RegisterStandardStore on _RegisterStandardStoreBase, Store {
  final _$nameStandardAtom =
      Atom(name: '_RegisterStandardStoreBase.nameStandard');

  @override
  String get nameStandard {
    _$nameStandardAtom.context.enforceReadPolicy(_$nameStandardAtom);
    _$nameStandardAtom.reportObserved();
    return super.nameStandard;
  }

  @override
  set nameStandard(String value) {
    _$nameStandardAtom.context.conditionallyRunInAction(() {
      super.nameStandard = value;
      _$nameStandardAtom.reportChanged();
    }, _$nameStandardAtom, name: '${_$nameStandardAtom.name}_set');
  }

  final _$descriptionStandardAtom =
      Atom(name: '_RegisterStandardStoreBase.descriptionStandard');

  @override
  String get descriptionStandard {
    _$descriptionStandardAtom.context
        .enforceReadPolicy(_$descriptionStandardAtom);
    _$descriptionStandardAtom.reportObserved();
    return super.descriptionStandard;
  }

  @override
  set descriptionStandard(String value) {
    _$descriptionStandardAtom.context.conditionallyRunInAction(() {
      super.descriptionStandard = value;
      _$descriptionStandardAtom.reportChanged();
    }, _$descriptionStandardAtom,
        name: '${_$descriptionStandardAtom.name}_set');
  }

  final _$urlImageStandardAtom =
      Atom(name: '_RegisterStandardStoreBase.urlImageStandard');

  @override
  String get urlImageStandard {
    _$urlImageStandardAtom.context.enforceReadPolicy(_$urlImageStandardAtom);
    _$urlImageStandardAtom.reportObserved();
    return super.urlImageStandard;
  }

  @override
  set urlImageStandard(String value) {
    _$urlImageStandardAtom.context.conditionallyRunInAction(() {
      super.urlImageStandard = value;
      _$urlImageStandardAtom.reportChanged();
    }, _$urlImageStandardAtom, name: '${_$urlImageStandardAtom.name}_set');
  }

  final _$categoriesStandardAtom =
      Atom(name: '_RegisterStandardStoreBase.categoriesStandard');

  @override
  List<String> get categoriesStandard {
    _$categoriesStandardAtom.context
        .enforceReadPolicy(_$categoriesStandardAtom);
    _$categoriesStandardAtom.reportObserved();
    return super.categoriesStandard;
  }

  @override
  set categoriesStandard(List<String> value) {
    _$categoriesStandardAtom.context.conditionallyRunInAction(() {
      super.categoriesStandard = value;
      _$categoriesStandardAtom.reportChanged();
    }, _$categoriesStandardAtom, name: '${_$categoriesStandardAtom.name}_set');
  }

  final _$idStandardAtom = Atom(name: '_RegisterStandardStoreBase.idStandard');

  @override
  String get idStandard {
    _$idStandardAtom.context.enforceReadPolicy(_$idStandardAtom);
    _$idStandardAtom.reportObserved();
    return super.idStandard;
  }

  @override
  set idStandard(String value) {
    _$idStandardAtom.context.conditionallyRunInAction(() {
      super.idStandard = value;
      _$idStandardAtom.reportChanged();
    }, _$idStandardAtom, name: '${_$idStandardAtom.name}_set');
  }

  final _$_RegisterStandardStoreBaseActionController =
      ActionController(name: '_RegisterStandardStoreBase');

  @override
  dynamic changeNameStandard(String value) {
    final _$actionInfo =
        _$_RegisterStandardStoreBaseActionController.startAction();
    try {
      return super.changeNameStandard(value);
    } finally {
      _$_RegisterStandardStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeDescriptionStandard(String value) {
    final _$actionInfo =
        _$_RegisterStandardStoreBaseActionController.startAction();
    try {
      return super.changeDescriptionStandard(value);
    } finally {
      _$_RegisterStandardStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeUrlImageStandard(String value) {
    final _$actionInfo =
        _$_RegisterStandardStoreBaseActionController.startAction();
    try {
      return super.changeUrlImageStandard(value);
    } finally {
      _$_RegisterStandardStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeCategoriesStandard(List<String> value) {
    final _$actionInfo =
        _$_RegisterStandardStoreBaseActionController.startAction();
    try {
      return super.changeCategoriesStandard(value);
    } finally {
      _$_RegisterStandardStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeIdStandard(String value) {
    final _$actionInfo =
        _$_RegisterStandardStoreBaseActionController.startAction();
    try {
      return super.changeIdStandard(value);
    } finally {
      _$_RegisterStandardStoreBaseActionController.endAction(_$actionInfo);
    }
  }
}
