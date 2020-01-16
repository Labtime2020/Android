// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$searchControllerAtom =
      Atom(name: '_HomeControllerBase.searchController');

  @override
  TextEditingController get searchController {
    _$searchControllerAtom.context.enforceReadPolicy(_$searchControllerAtom);
    _$searchControllerAtom.reportObserved();
    return super.searchController;
  }

  @override
  set searchController(TextEditingController value) {
    _$searchControllerAtom.context.conditionallyRunInAction(() {
      super.searchController = value;
      _$searchControllerAtom.reportChanged();
    }, _$searchControllerAtom, name: '${_$searchControllerAtom.name}_set');
  }

  final _$scrollControllerAtom =
      Atom(name: '_HomeControllerBase.scrollController');

  @override
  ScrollController get scrollController {
    _$scrollControllerAtom.context.enforceReadPolicy(_$scrollControllerAtom);
    _$scrollControllerAtom.reportObserved();
    return super.scrollController;
  }

  @override
  set scrollController(ScrollController value) {
    _$scrollControllerAtom.context.conditionallyRunInAction(() {
      super.scrollController = value;
      _$scrollControllerAtom.reportChanged();
    }, _$scrollControllerAtom, name: '${_$scrollControllerAtom.name}_set');
  }

  final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase');

  @override
  dynamic fetchList() {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction();
    try {
      return super.fetchList();
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }
}
