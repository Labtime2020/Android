import 'dart:io';

import 'package:file_picker/file_picker.dart';
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
  String nameStandard;
  @action
  changeNameStandard(String value) => nameStandard = value;

  @observable
  String descriptionStandard;
  @action
  changeDescriptionStandard(String value) => descriptionStandard = value;

  @observable
  String urlImageStandard;
  @action
  changeUrlImageStandard(String value) => urlImageStandard = value;

  @observable
  List<String> categoriesStandard;
  @action
  changeCategoriesStandard(List<String> value) => categoriesStandard = value;

  @observable
  String idStandard;
  @action
  changeIdStandard(String value) => idStandard = value;

  //TO DO AVATAR FILE
}
