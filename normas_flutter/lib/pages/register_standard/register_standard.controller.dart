import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:normas_flutter/models/norma.model.dart';
import 'package:normas_flutter/pages/register_standard/register_standard.api.dart';
import 'package:normas_flutter/pages/register_standard/register_standard.store.dart';
import 'package:normas_flutter/utils/alert.dart';
import 'package:normas_flutter/utils/api_response.dart';
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

  @computed
  bool get registerStandardIsValid {
    return validateNameStandard() == null &&
        validateDescriptionStandard() == null &&
        (userRegisterStandard.urlFileStandard != null ||
            userRegisterStandard.fileStandard != null);
  }

  Future getFile() async {
    File file = await FilePicker.getFile();

    if (file != null) {
      userRegisterStandard.fileStandard = file;
      print(userRegisterStandard.fileStandard.toString());
    }
  }

  Future<void> onClickRegisterStandard(BuildContext context) async {
    String nameStandard = userRegisterStandard.nameStandard;
    String descriptionStandard = userRegisterStandard.descriptionStandard;
    String urlFileStandard = userRegisterStandard.urlFileStandard;
    List<String> categoriesStandard = userRegisterStandard.categoriesStandard;
    int idStandard = userRegisterStandard.idStandard;
    File fileStandard = userRegisterStandard.fileStandard;

    print(
        "nameStandard: $nameStandard, descriptionStandard: $descriptionStandard, urlImageStandard: $urlFileStandard, categoriesStandard: $categoriesStandard, idStandard: $idStandard, fileStandard: ${fileStandard.toString()}");

    ApiResponse response = await RegisterStandardApi.registerStandard(
        nameStandard,
        descriptionStandard,
        urlFileStandard,
        categoriesStandard,
        idStandard,
        fileStandard);

    if (response.ok) {
      Standard registerStandard = response.result;
      print(">>> $registerStandard");
    } else {
      alert(context, response.msg, "Cadastrar");
    }
  }
}
