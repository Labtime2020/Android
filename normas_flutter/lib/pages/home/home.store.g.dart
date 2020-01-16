// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on _HomeStoreBase, Store {
  final _$standardsAtom = Atom(name: '_HomeStoreBase.standards');

  @override
  Standards get standards {
    _$standardsAtom.context.enforceReadPolicy(_$standardsAtom);
    _$standardsAtom.reportObserved();
    return super.standards;
  }

  @override
  set standards(Standards value) {
    _$standardsAtom.context.conditionallyRunInAction(() {
      super.standards = value;
      _$standardsAtom.reportChanged();
    }, _$standardsAtom, name: '${_$standardsAtom.name}_set');
  }
}
