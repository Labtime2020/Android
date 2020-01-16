import 'dart:io';

import 'package:mobx/mobx.dart';
part 'register_standard.store.g.dart';

class RegisterStandardStore = _RegisterStandardStoreBase
    with _$RegisterStandardStore;

abstract class _RegisterStandardStoreBase with Store {
  @observable
  File fileStandard;
  @action
  changeFileStandard(File value) => fileStandard = value;

  @observable
  String nameStandard = "";
  @action
  changeNameStandard(String value) => nameStandard = value;

  @observable
  String descriptionStandard = "";
  @action
  changeDescriptionStandard(String value) => descriptionStandard = value;

  @observable
  String urlFileStandard = "";
  @action
  changeUrlFileStandard(String value) => urlFileStandard = value;

  @observable
  List<String> categoriesStandard = [];
  @action
  changeCategoriesStandard(List<String> value) => categoriesStandard = value;
  @action
  addCategoriesStandard(String value) => categoriesStandard.add(value);
  @action
  removeCategoriesStandard(int value) => categoriesStandard.removeAt(value);

  @observable
  int idStandard;
  @action
  changeIdStandard(int value) => idStandard = value;
}
