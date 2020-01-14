import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:normas_flutter/pages/api_response.dart';
import 'package:normas_flutter/pages/register_standard/register_standard.api.dart';
import 'package:normas_flutter/pages/register_standard/register_standard.store.dart';
import 'package:normas_flutter/utils/alert.dart';
part 'register_standard.controller.g.dart';

class RegisterStandardController = _RegisterStandardControllerBase
    with _$RegisterStandardController;

abstract class _RegisterStandardControllerBase with Store {
  var userRegisterStandard = RegisterStandardStore();

  String validateNameStandard() {
    if (userRegisterStandard.nameStandard == null ||
        userRegisterStandard.nameStandard.isEmpty) {
      return "Este campo é obrigatorio";
    }
    return null;
  }

  String validateDescriptionStandard() {
    if (userRegisterStandard.descriptionStandard == null ||
        userRegisterStandard.descriptionStandard.isEmpty) {
      return "Este campo é obrigatorio";
    }
    if (userRegisterStandard.descriptionStandard.length > 1000) {
      var newDescripitonStandard = '';
      newDescripitonStandard =
          userRegisterStandard.descriptionStandard.substring(0, 1000);
      userRegisterStandard.descriptionStandard = newDescripitonStandard;

      return "Tamanho máximo de 1000 caracteres";
    }
    return null;
  }

  String validateUrlImageStandard() {
    if (userRegisterStandard.urlImageStandard == null ||
        userRegisterStandard.urlImageStandard.isEmpty) {
      return "Este campo é obrigatorio";
    }
    return null;
  }

  @computed
  bool get registerStandardIsValid {
    return validateNameStandard() == null &&
        validateDescriptionStandard() == null;
  }

  Future getFile() async {
    File file = await FilePicker.getFile();

    userRegisterStandard.fileStandard = file;
    print(userRegisterStandard.fileStandard.toString());
  }

  Future<void> onClickRegisterStandard(BuildContext context) async {
    String nameStandard = userRegisterStandard.nameStandard;
    String descriptionStandard = userRegisterStandard.descriptionStandard;
    String urlImageStandard = userRegisterStandard.urlImageStandard;
    List<String> categoriesStandard = userRegisterStandard.categoriesStandard;
    String idStandard = userRegisterStandard.idStandard;

    print(
        "nameStandard: $nameStandard, descriptionStandard: $descriptionStandard, urlImageStandard: $urlImageStandard, categoriesStandard: $categoriesStandard, idStandard: $idStandard");

    ApiResponse response = await RegisterStandardApi.registerStandard(
        nameStandard,
        descriptionStandard,
        urlImageStandard,
        categoriesStandard,
        idStandard);

    if (response.ok) {
      //User userRegisterStandard = response.result;
      //print(">>> $userRegisterStandard");
    } else {
      alert(context, response.msg, "Cadastrar");
    }
  }
}
