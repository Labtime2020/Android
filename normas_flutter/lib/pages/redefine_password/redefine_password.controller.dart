import 'dart:async';

import 'package:mobx/mobx.dart';
import 'package:normas_flutter/models/user.model.dart';
import 'package:normas_flutter/pages/redefine_password/redefine_password.api.dart';
import 'package:normas_flutter/pages/redefine_password/redefine_password.store.dart';
import 'package:normas_flutter/utils/api_response.dart';
part 'redefine_password.controller.g.dart';

class RedefinePasswordController = _RedefinePasswordControllerBase
    with _$RedefinePasswordController;

abstract class _RedefinePasswordControllerBase with Store {
  var userRedefinePassword = RedefinePasswordStore();

  String validatePassword() {
    print(userRedefinePassword.password);
    if (userRedefinePassword.password == null ||
        userRedefinePassword.password.isEmpty) {
      return "Este campo é obrigatorio";
    }
    // if (!(userSignUp.password.length >= 6 &&
    //     userSignUp.password.length < 15 &&
    //     !userSignUp.password.contains(RegExp(r'\W')))) {
    //   return "Letras e números, de 6 a 15 caracteres";
    // }
    if (userRedefinePassword.password != userRedefinePassword.passwordConfirm) {
      return "Senha não confere";
    }
    return null;
  }

  String validatePasswordConfirm() {
    print(userRedefinePassword.passwordConfirm);
    if (userRedefinePassword.passwordConfirm == null ||
        userRedefinePassword.passwordConfirm.isEmpty) {
      return "Este campo é obrigatorio";
    }
    // if (!(userSignUp.password.length >= 6 &&
    //     userSignUp.password.length < 15 &&
    //     !userSignUp.password.contains(RegExp(r'\W')))) {
    //   return "Letras e números, de 6 a 15 caracteres";
    // }
    if (userRedefinePassword.password != userRedefinePassword.passwordConfirm) {
      return "Senha não confere";
    }
    return null;
  }

  @computed
  bool get signUpIsValid {
    return validatePassword() == null && validatePasswordConfirm() == null;
  }

  Future<void> onClickRedefinePassword() async {
    String login = "mrcs@dev.com";
    String password = userRedefinePassword.password;

    print("Login: $login, Senha: $password");

    ApiResponse response = await RedefinePasswordApi.login(login, password);

    if (response.ok) {
      User user = response.result;
      print(">>> $user");
    } else {
      //alert(context, response.msg);
    }
  }
}
